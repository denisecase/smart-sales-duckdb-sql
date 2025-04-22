-- Count rows in each table
SELECT 'fact_sales' AS table_name, COUNT(*) AS row_count FROM fact_sales
UNION ALL
SELECT 'dim_customer', COUNT(*) FROM dim_customer
UNION ALL
SELECT 'dim_product', COUNT(*) FROM dim_product
UNION ALL
SELECT 'dim_store', COUNT(*) FROM dim_store
UNION ALL
SELECT 'dim_date', COUNT(*) FROM dim_date
UNION ALL
SELECT 'dim_promotion', COUNT(*) FROM dim_promotion
UNION ALL
SELECT 'dim_product_category', COUNT(*) FROM dim_product_category
UNION ALL
SELECT 'dim_product_subcategory', COUNT(*) FROM dim_product_subcategory;
