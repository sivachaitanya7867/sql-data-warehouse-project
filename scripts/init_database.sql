/* 
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

WARNING: Running this script will drop the entire 'datawarehouse' database if it already exists.
            All data in the database will be permanently deleted. Proceed with caution
            and ensure you have proper backups before running this script.
*/

USE master;

--Drop and recreate 'datawarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE
  DROP DATABASE DataWarehouse
END;
GO

--Create Database 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Creating Schemas for each layer
CREATE SCHEMA bronze;
GO --A separator that tells SQL first to execute the above selected lines completely.
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
