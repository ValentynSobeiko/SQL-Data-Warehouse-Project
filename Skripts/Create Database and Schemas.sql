
/*
						Create Database and Schemas


This script create 
This script creates a new database named 'DataWarehouse' after checking if it already exists. 
If the database exists, it is dropped and recreated. 
Additionally, the script sets up three sche within the database: 'bronze', 'silver', and 'gold'.

*/


-- Create The 'DataWarehouse' database
Create DATABASE DataWarehouse;
GO

Use DataWarehouse;
GO


-- Create Schemas
Create Schema Bronze;
GO

Create Schema Silver;
GO

Create Schema Gold;
GO