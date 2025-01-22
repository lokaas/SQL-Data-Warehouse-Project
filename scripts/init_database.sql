/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

    WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.

    Note:
    If you already have a database with the same name ('DataWarehouse'), the existing database will be dropped
    and all of its data will be permanently lost.
    
=============================================================
*/

-- Step 1: Switch to the 'master' database (to perform global operations)
USE master;
GO

-- Step 2: Check if the 'DataWarehouse' database already exists
-- If it exists, drop the database and all its objects.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Set the database to SINGLE_USER mode to disconnect all users before dropping it
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the existing 'DataWarehouse' database
    DROP DATABASE DataWarehouse;
END;
GO

-- Step 3: Create a new 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Step 4: Switch to the newly created 'DataWarehouse' database
USE DataWarehouse;
GO

-- Step 5: Create the 'bronze' schema
-- The 'bronze' schema will be used for raw or unprocessed data, traceability, and debugging.
CREATE SCHEMA bronze;
GO

-- Step 6: Create the 'silver' schema
-- The 'silver' schema will be used to prepare data for analysis.
CREATE SCHEMA silver;
GO

-- Step 7: Create the 'gold' schema
-- The 'gold' schema will be used to provide data to be consumed for reporting and analytics.
CREATE SCHEMA gold;
GO
