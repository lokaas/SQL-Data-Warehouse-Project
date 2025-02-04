/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV files to bronze tables.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

-- Create or alter the stored procedure to load data into the bronze schema
CREATE OR ALTER PROCEDURE bronze.load_bronze As
BEGIN
    -- Declare variables for tracking start and end times for batch and individual loads
    DECLARE @start_time DATETIME , @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 

    BEGIN TRY
        -- Record the start time for the batch load process
        SET @batch_start_time=GETDATE();
        PRINT'================================================';
        PRINT'Loading Bronze Layer';
        PRINT'================================================';

        -- Print a message for starting the loading of CRM tables
        PRINT'------------------------------------------------';
        PRINT'Loading CRM Tables';
        PRINT'------------------------------------------------'

        -- Load data into the 'crm_cust_info' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.crm_cust_info';  -- Truncate the table before inserting data
        TRUNCATE TABLE bronze.crm_cust_info;
        
        PRINT'>> Inserting Data Table: bronze.crm_cust_info';  -- Insert data from the CSV file
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_crm\cust_info.csv'
        WITH(
            FIRSTROW = 2 ,             -- Skip the first row (header row) of the CSV
            FIELDTERMINATOR = ',' ,    -- Specify the field delimiter as a comma
            TABLOCK                   -- Use table-level locking for faster insert
        );

        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'crm_cust_info'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';

        -- Load data into the 'crm_prd_info' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT'>> Inserting Data Table: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_crm\prd_info.csv'
        WITH(
            FIRSTROW = 2 , 
            FIELDTERMINATOR = ',' ,
            TABLOCK
        );

        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'crm_prd_info'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';
        
        -- Load data into the 'crm_sales_details' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT'>> Inserting Data Table: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_crm\sales_details.csv'
        WITH(
            FIRSTROW = 2 ,
            FIELDTERMINATOR = ',' ,
            TABLOCK
        ); 

        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'crm_sales_details'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';


        -- Print a message for starting the loading of ERP tables
        PRINT'------------------------------------------------';
        PRINT'Loading ERP Tables';
        PRINT'------------------------------------------------'
        
        -- Load data into the 'erp_cust_az12' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT'>> Inserting Data Table: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_erp\CUST_AZ12.csv'
        WITH(
            FIRSTROW = 2 ,
            FIELDTERMINATOR = ',' ,
            TABLOCK
        );

        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'erp_cust_az12'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';


        -- Load data into the 'erp_loc_a101' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT'>> Inserting Data Table: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_erp\LOC_A101.csv'
        WITH(
            FIRSTROW = 2 ,
            FIELDTERMINATOR = ',' ,
            TABLOCK
        );
        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'erp_loc_a101'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';

        -- Load data into the 'erp_px_cat_g1v2' table
        SET @start_time=GETDATE();
        PRINT'>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT'>> Inserting Data Table: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\peojects\Data Engineer Portfolio Project\SQL_data-warehouse_project by me\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH(
            FIRSTROW = 2 ,
            FIELDTERMINATOR = ',' ,
            TABLOCK
        );
        SET @end_time=GETDATE();
        -- Print the duration of the load operation for 'erp_px_cat_g1v2'
        PRINT'>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second'
        PRINT '>> -------------';

        -- Record the batch end time and print the total load duration
        SET @batch_end_time = GETDATE();
        PRINT '=========================================='
        PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '==========================================';

    END TRY 

    -- Catch any errors that occur during the process
    BEGIN CATCH
        -- Print the error details if an error occurs
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';
    END CATCH
END
