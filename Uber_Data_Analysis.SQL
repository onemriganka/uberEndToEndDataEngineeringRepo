-- SQL_Uber_Data_Analysis.sql
-- Uber Data Analysis Queries with ETL Pipeline and Power BI Integration

-- Total number of trips
SELECT COUNT(trip_id) AS total_trips
FROM fact_table;

-- Average fare amount for each vendor
SELECT VendorID, AVG(fare_amount) AS avg_fare
FROM fact_table
GROUP BY VendorID
ORDER BY avg_fare DESC;

-- Total fare amount for each vendor
SELECT VendorID, SUM(fare_amount) AS total_fare
FROM fact_table
GROUP BY VendorID
ORDER BY total_fare DESC;

-- Average tip amount by payment type
SELECT p.payment_type_name, AVG(f.tip_amount) AS avg_tip
FROM fact_table f
JOIN payment_type_dim p
    ON f.payment_type_id = p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY avg_tip DESC;

-- Top 10 pickup locations based on trip count
SELECT TOP 10 p.pickup_location_id, COUNT(f.trip_id) AS trip_count
FROM fact_table f
JOIN pickup_location_dim p
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY trip_count DESC;

-- Total trips by passenger count
SELECT passenger_count, COUNT(trip_id) AS total_trips
FROM fact_table
GROUP BY passenger_count
ORDER BY total_trips DESC;

-- Average fare by hour of the day (pickup time)
SELECT p.pick_hour AS hour_of_day, AVG(f.fare_amount) AS avg_fare
FROM fact_table f
JOIN pickup_datetime_dim p
    ON f.pick_datetime_id = p.pick_datetime_id
GROUP BY p.pick_hour
ORDER BY p.pick_hour;

-- Average fare by hour of the day (dropoff time)
SELECT d.drop_hour AS hour_of_day, AVG(f.fare_amount) AS avg_fare
FROM fact_table f
JOIN dropoff_datetime_dim d
    ON f.drop_datetime_id = d.drop_datetime_id
GROUP BY d.drop_hour
ORDER BY d.drop_hour;

-- Total fare by pickup location
SELECT p.pickup_location_id, SUM(f.fare_amount) AS total_fare
FROM fact_table f
JOIN pickup_location_dim p
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY total_fare DESC;

-- Total trips by hour of the day (pickup)
SELECT p.pick_hour, COUNT(f.trip_id) AS trip_count
FROM fact_table f
JOIN pickup_datetime_dim p
    ON f.pick_datetime_id = p.pick_datetime_id
GROUP BY p.pick_hour
ORDER BY p.pick_hour;

-- Average trip distance by pickup location
SELECT p.pickup_location_id, AVG(f.trip_distance) AS avg_distance
FROM fact_table f
JOIN pickup_location_dim p
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY avg_distance DESC;

-- Total fare by day of the week (pickup)
SELECT p.pick_weekday, SUM(f.fare_amount) AS total_fare
FROM fact_table f
JOIN pickup_datetime_dim p
    ON f.pick_datetime_id = p.pick_datetime_id
GROUP BY p.pick_weekday
ORDER BY total_fare DESC;

-- Total trips by payment type
SELECT p.payment_type_name, COUNT(f.trip_id) AS total_trips
FROM fact_table f
JOIN payment_type_dim p
    ON f.payment_type_id = p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY total_trips DESC;

-- Longest trip distance
SELECT TOP 1 trip_id, trip_distance
FROM fact_table
ORDER BY trip_distance DESC;

-- Total fare by rate code
SELECT r.rate_code_name, SUM(f.fare_amount) AS total_fare
FROM fact_table f
JOIN rate_code_dim r
    ON f.rate_code_id = r.rate_code_id
GROUP BY r.rate_code_name
ORDER BY total_fare DESC;

-- Average trip duration by pickup location
SELECT pl.pickup_location_id,
       AVG(DATEDIFF(MINUTE, pd.tpep_pickup_datetime, dd.tpep_dropoff_datetime)) AS avg_trip_duration
FROM fact_table f
JOIN pickup_location_dim pl
    ON f.pickup_location_id = pl.pickup_location_id
JOIN pickup_datetime_dim pd
    ON f.pick_datetime_id = pd.pick_datetime_id
JOIN dropoff_datetime_dim dd
    ON f.drop_datetime_id = dd.drop_datetime_id
GROUP BY pl.pickup_location_id
ORDER BY avg_trip_duration DESC;

-- Total distance traveled by pickup location
SELECT p.pickup_location_id, SUM(trip_distance) AS total_distance
FROM fact_table f
JOIN pickup_location_dim p
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY total_distance DESC;

-- Top 5 most expensive trips
SELECT TOP 5 trip_id, fare_amount
FROM fact_table
ORDER BY fare_amount DESC;

-- Average passenger count by payment type
SELECT p.payment_type_name, AVG(f.passenger_count) AS avg_passenger_count
FROM fact_table f
JOIN payment_type_dim p
    ON f.payment_type_id = p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY avg_passenger_count DESC;
