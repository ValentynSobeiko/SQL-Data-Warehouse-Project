/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - Track trends, growth, and changes in key metrics over time.
    - Perform time-series analysis and identify seasonality.
    - Measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- Analyze sales performance over time
-- Quick Date Functions

SELECT 
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sales_amount) AS Total_Sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

-- Using DATETRUNC() for monthly aggregation

SELECT 
DATETRUNC(month,order_date) AS order_date,
SUM(sales_amount) AS Total_Sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
ORDER BY DATETRUNC(month,order_date)

-- Using FORMAT() for custom period labels

SELECT 
FORMAT(order_date, 'yyyy-MMM') AS order_date,
SUM(sales_amount) AS Total_Sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')


