SELECT *
FROM workspace.default.bright_coffee_case_study
LIMIT 10;

------------------------------------
--1. Checking the date range
------------------------------------
--They started collecting the data on 2023-01-01
SELECT MIN(transaction_date) AS min_date
FROM workspace.default.bright_coffee_case_study;
--They last collected the data on 2023-06-30
SELECT MAX(transaction_date) AS latest_date
FROM workspace.default.bright_coffee_case_study;
-------------------------------------
--1. checking the date range
-------------------------------------

-----------------------------------------------
--2. checking the names of the different stores
-----------------------------------------------
SELECT DISTINCT store_location
FROM  workspace.default.bright_coffee_case_study;
--------------------------------------------------


---------------------------------------------------
--3. CHECKING THE PRODUCTS SOLD
---------------------------------------------------
SELECT DISTINCT product_category AS products_sold
FROM workspace.default.bright_coffee_case_study;

SELECT DISTINCT product_detail AS product_name,
                product_category AS category,
                product_type AS type
FROM  workspace.default.bright_coffee_case_study; 


-------------------------------------------------------
--4. checking the prices of the products
--------------------------------------------------------
SELECT MIN(unit_price) AS cheapest_price
FROM workspace.default.bright_coffee_case_study;


SELECT MAX(unit_price) AS highest_price
FROM workspace.default.bright_coffee_case_study;
------------------------------------------------------------

SELECT 
       transaction_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS month_name,
       
       date_format(transaction_time, 'HH:MM:SS' ) AS purchase_time,

       CASE
            WHEN date_format(transaction_time,  'HH:MM:SS') BETWEEN '00:00:00' AND '11:59:59' THEN  '01. Morning'
            WHEN date_format(transaction_time,  'HH:MM:SS') BETWEEN '12:00:00' AND '16:59:59' THEN  '02. Afternoon'
            WHEN date_format(transaction_time,  'HH:MM:SS') >= '17:00:00' THEN  '03. Evening'
       END AS time_buckets,





       COUNT(DISTINCT transaction_id) AS Number_of_sales,
       COUNT(DISTINCT product_id) AS Number_of_products,
       COUNT(DISTINCT store_id) AS Number_of_stores,

       SUM(transaction_qty*unit_price) AS revenue_per_day,


        
         
         store_location,
         product_category,
         product_detail
FROM workspace.default.bright_coffee_case_study
GROUP BY transaction_date,
         Day_name,
         Month_name,
         purchase_time,
         time_buckets,
         store_location,
         product_category,
         product_detail;


       
