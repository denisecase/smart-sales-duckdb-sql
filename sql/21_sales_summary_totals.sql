-- Title: Sales Summary Totals
-- This SQL script provides a high-level summary of sales data from the fact_sales table.
-- Use DESCRIBE fact_sales; to see the columns in the fact_sales table
-- Your table names and column names must match the ones in the data warehouse
-- You can comment out the DESCRIBE statement if you don't need it 
-- by adding -- at the beginning of the line

DESCRIBE fact_sales;

SELECT 
  COUNT(*) AS record_count,
  SUM(SalesQuantity) AS total_quantity,
  SUM(SalesAmount) AS total_sales_amount
FROM fact_sales;