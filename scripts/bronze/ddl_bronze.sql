/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

-- Drop the table if it already exists and create a new 'crm_cust_info' table
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;
GO

-- Create the 'crm_cust_info' table in the 'silver' schema
CREATE TABLE silver.crm_cust_info (
    cst_id             INT,             -- Customer ID (integer)
    cst_key            NVARCHAR(50),    -- Customer key (nvarchar type)
    cst_firstname      NVARCHAR(50),    -- Customer's first name (nvarchar type)
    cst_lastname       NVARCHAR(50),    -- Customer's last name (nvarchar type)
    cst_marital_status NVARCHAR(50),    -- Customer's marital status (nvarchar type)
    cst_gndr           NVARCHAR(50),    -- Customer's gender (nvarchar type)
    cst_create_date    DATE,            -- Date when the customer record was created
    dwh_create_date    DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO

-- Drop the table if it already exists and create a new 'crm_prd_info' table
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
GO

-- Create the 'crm_prd_info' table in the 'silver' schema
CREATE TABLE silver.crm_prd_info (
    prd_id          INT,             -- Product ID (integer)
    cat_id          NVARCHAR(50),    -- Category ID (nvarchar type)
    prd_key         NVARCHAR(50),    -- Product key (nvarchar type)
    prd_nm          NVARCHAR(50),    -- Product name (nvarchar type)
    prd_cost        INT,             -- Product cost (integer)
    prd_line        NVARCHAR(50),    -- Product line (nvarchar type)
    prd_start_dt    DATE,            -- Product start date (date type)
    prd_end_dt      DATE,            -- Product end date (date type)
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO

-- Drop the table if it already exists and create a new 'crm_sales_details' table
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
GO

-- Create the 'crm_sales_details' table in the 'silver' schema
CREATE TABLE silver.crm_sales_details (
    sls_ord_num     NVARCHAR(50),    -- Sales order number (nvarchar type)
    sls_prd_key     NVARCHAR(50),    -- Sales product key (nvarchar type)
    sls_cust_id     INT,             -- Customer ID (integer)
    sls_order_dt    DATE,            -- Sales order date (date type)
    sls_ship_dt     DATE,            -- Sales shipping date (date type)
    sls_due_dt      DATE,            -- Sales due date (date type)
    sls_sales       INT,             -- Sales amount (integer)
    sls_quantity    INT,             -- Sales quantity (integer)
    sls_price       INT,             -- Sales price (integer)
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO

-- Drop the table if it already exists and create a new 'erp_loc_a101' table
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

-- Create the 'erp_loc_a101' table in the 'silver' schema
CREATE TABLE silver.erp_loc_a101 (
    cid             NVARCHAR(50),    -- Customer ID (nvarchar type)
    cntry           NVARCHAR(50),    -- Country (nvarchar type)
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO

-- Drop the table if it already exists and create a new 'erp_cust_az12' table
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

-- Create the 'erp_cust_az12' table in the 'silver' schema
CREATE TABLE silver.erp_cust_az12 (
    cid             NVARCHAR(50),    -- Customer ID (nvarchar type)
    bdate           DATE,            -- Birthdate (date type)
    gen             NVARCHAR(50),    -- Gender (nvarchar type)
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO

-- Drop the table if it already exists and create a new 'erp_px_cat_g1v2' table
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

-- Create the 'erp_px_cat_g1v2' table in the 'silver' schema
CREATE TABLE silver.erp_px_cat_g1v2 (
    id              NVARCHAR(50),    -- ID (nvarchar type)
    cat             NVARCHAR(50),    -- Category (nvarchar type)
    subcat          NVARCHAR(50),    -- Subcategory (nvarchar type)
    maintenance     NVARCHAR(50),    -- Maintenance (nvarchar type)
    dwh_create_date DATETIME2 DEFAULT GETDATE() -- The date and time the record was created in the data warehouse
);
GO
