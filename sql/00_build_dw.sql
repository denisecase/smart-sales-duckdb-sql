-- sql/00_build_dw.sql
-- Rebuild the data warehouse from CSV files in data/prepared/

-- Drop tables if they exist
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_product_subcategory;
DROP TABLE IF EXISTS dim_product_category;
DROP TABLE IF EXISTS dim_promotion;
DROP TABLE IF EXISTS dim_store;

-- Create dimension tables

CREATE TABLE dim_customer AS
SELECT * FROM 'data/prepared/DimCustomer.csv';

CREATE TABLE dim_date AS
SELECT * FROM 'data/prepared/DimDate.csv';

CREATE TABLE dim_product AS
SELECT * FROM 'data/prepared/DimProduct.csv';

CREATE TABLE dim_product_subcategory AS
SELECT * FROM 'data/prepared/DimProductSubcategory.csv';

CREATE TABLE dim_product_category AS
SELECT * FROM 'data/prepared/DimProductCategory.csv';

CREATE TABLE dim_promotion AS
SELECT * FROM 'data/prepared/DimPromotion.csv';

CREATE TABLE dim_store AS
SELECT * FROM 'data/prepared/DimStore.csv';

-- Create fact table

CREATE TABLE fact_sales AS
SELECT * FROM 'data/prepared/FactSales.csv';
