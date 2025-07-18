-- Uber Data Warehouse Schema
-- Creates the database and tables necessary for Uber trip analysis

-- Create the Data Warehouse
CREATE DATABASE Uber_Trip_DW;
USE Uber_Trip_DW;

-- Dropoff Datetime Dimension Table
CREATE TABLE dropoff_datetime_dim (
    drop_datetime_id INT PRIMARY KEY,
    dropoff_datetime DATETIME NOT NULL,
    drop_hour INT CHECK (drop_hour BETWEEN 0 AND 23),
    drop_day INT CHECK (drop_day BETWEEN 1 AND 31),
    drop_month INT CHECK (drop_month BETWEEN 1 AND 12),
    drop_year INT,
    drop_weekday INT CHECK (drop_weekday BETWEEN 0 AND 6)
);

-- Pickup Datetime Dimension Table
CREATE TABLE pickup_datetime_dim (
    pick_datetime_id INT PRIMARY KEY,
    pickup_datetime DATETIME NOT NULL,
    pick_hour INT CHECK (pick_hour BETWEEN 0 AND 23),
    pick_day INT CHECK (pick_day BETWEEN 1 AND 31),
    pick_month INT CHECK (pick_month BETWEEN 1 AND 12),
    pick_year INT,
    pick_weekday INT CHECK (pick_weekday BETWEEN 0 AND 6)
);

-- Rate Code Dimension Table
CREATE TABLE rate_code_dim (
    rate_code_id INT PRIMARY KEY,
    RatecodeID INT NOT NULL,
    rate_code_name VARCHAR(255) NOT NULL
);

-- Pickup Location Dimension Table
CREATE TABLE pickup_location_dim (
    pickup_location_id INT PRIMARY KEY,
    pickup_longitude FLOAT CHECK (pickup_longitude BETWEEN -180 AND 180),
    pickup_latitude FLOAT CHECK (pickup_latitude BETWEEN -90 AND 90)
);

-- Dropoff Location Dimension Table
CREATE TABLE dropoff_location_dim (
    dropoff_location_id INT PRIMARY KEY,
    dropoff_longitude FLOAT CHECK (dropoff_longitude BETWEEN -180 AND 180),
    dropoff_latitude FLOAT CHECK (dropoff_latitude BETWEEN -90 AND 90)
);

-- Payment Type Dimension Table
CREATE TABLE payment_type_dim (
    payment_type_id INT PRIMARY KEY,
    payment_type INT NOT NULL,
    payment_type_name VARCHAR(255) NOT NULL
);

-- Fact Table (Trip Records)
CREATE TABLE trip_fact_table (
    trip_id INT PRIMARY KEY,
    vendor_id INT,
    rate_code_id INT,
    pickup_location_id INT,
    dropoff_location_id INT,
    pick_datetime_id INT,
    drop_datetime_id INT,
    payment_type_id INT,
    passenger_count INT CHECK (passenger_count > 0),
    trip_distance FLOAT CHECK (trip_distance >= 0),
    fare_amount FLOAT CHECK (fare_amount >= 0),
    extra FLOAT CHECK (extra >= 0),
    mta_tax FLOAT CHECK (mta_tax >= 0),
    tip_amount FLOAT CHECK (tip_amount >= 0),
    tolls_amount FLOAT CHECK (tolls_amount >= 0),
    improvement_surcharge FLOAT CHECK (improvement_surcharge >= 0),
    total_amount FLOAT CHECK (total_amount >= 0),
    FOREIGN KEY (rate_code_id) REFERENCES rate_code_dim (rate_code_id),
    FOREIGN KEY (pickup_location_id) REFERENCES pickup_location_dim (pickup_location_id),
    FOREIGN KEY (dropoff_location_id) REFERENCES dropoff_location_dim (dropoff_location_id),
    FOREIGN KEY (pick_datetime_id) REFERENCES pickup_datetime_dim (pick_datetime_id),
    FOREIGN KEY (drop_datetime_id) REFERENCES dropoff_datetime_dim (drop_datetime_id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type_dim (payment_type_id)
);
