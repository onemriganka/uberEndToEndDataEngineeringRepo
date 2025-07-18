-- Insert_data.sql
-- SQL Script for Bulk Inserting Uber Dataset CSV files into SQL Server Tables

-- Dropoff Datetime Dimension
BEGIN TRY
    PRINT 'Inserting data into dropoff_datetime_dim...';
    BULK INSERT dropoff_datetime_dim
    FROM 'D:\Uber Project\dropoff_datetime_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',  -- Fields are separated by commas
        ROWTERMINATOR = '\n',   -- Each row ends with a new line
        FIRSTROW = 2,           -- Skip the header row
        TABLOCK                 -- Lock table for faster insert
    );
    PRINT 'Data inserted into dropoff_datetime_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into dropoff_datetime_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Pickup Datetime Dimension
BEGIN TRY
    PRINT 'Inserting data into pickup_datetime_dim...';
    BULK INSERT pickup_datetime_dim
    FROM 'D:\Uber Project\pickup_datetime_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into pickup_datetime_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into pickup_datetime_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Pickup Location Dimension
BEGIN TRY
    PRINT 'Inserting data into pickup_location_dim...';
    BULK INSERT pickup_location_dim
    FROM 'D:\Uber Project\pickup_location_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into pickup_location_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into pickup_location_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Dropoff Location Dimension
BEGIN TRY
    PRINT 'Inserting data into dropoff_location_dim...';
    BULK INSERT dropoff_location_dim
    FROM 'D:\Uber Project\dropoff_location_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into dropoff_location_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into dropoff_location_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Payment Type Dimension
BEGIN TRY
    PRINT 'Inserting data into payment_type_dim...';
    BULK INSERT payment_type_dim
    FROM 'D:\Uber Project\payment_type_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into payment_type_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into payment_type_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Rate Code Dimension
BEGIN TRY
    PRINT 'Inserting data into rate_code_dim...';
    BULK INSERT rate_code_dim
    FROM 'D:\Uber Project\rate_code_dim.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into rate_code_dim successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into rate_code_dim.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

-- Fact Table
BEGIN TRY
    PRINT 'Inserting data into fact_table...';
    BULK INSERT fact_table
    FROM 'D:\Uber Project\fact_table.csv'
    WITH (
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        FIRSTROW = 2,
        TABLOCK
    );
    PRINT 'Data inserted into fact_table successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error inserting data into fact_table.';
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
