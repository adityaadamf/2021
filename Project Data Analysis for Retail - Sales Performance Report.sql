-- Using dqlab_sales_store.sql

-- 1. DQLab Store Overall Performance

-- Overall Performance by Year
SELECT YEAR(order_date) AS years, SUM(sales) AS sales, COUNT(order_id) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;

-- Overall Performance by Product Sub Category
SELECT YEAR(order_date) AS years, product_sub_category, SUM(sales) AS sales
FROM dqlab_sales_store
WHERE YEAR(order_date) BETWEEN 2011 AND 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category
ORDER BY years, sales DESC;

-- 2. DQLab Store Promotion Effectiveness and Efficiency

-- Promotion Effectiveness and Efficiency by Years
SELECT YEAR(order_date) AS years, SUM(sales) AS sales, SUM(discount_value) AS promotion_value, ROUND(SUM(discount_value) / SUM(sales) * 100, 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years
ORDER BY years;

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT YEAR(order_date) years, product_sub_category, product_category, SUM(sales) sales, SUM(discount_value) promotion_value, ROUND(SUM(discount_value) / SUM(sales) * 100, 2) burn_rate_percentage
FROM dqlab_sales_store
WHERE YEAR(order_date) = 2012 AND order_status = 'Order Finished'
GROUP BY years, product_sub_category, product_category
ORDER BY sales DESC;

-- 3. Customer Analytics

-- Customers Transactions per Year
SELECT YEAR(order_date) years, COUNT(DISTINCT customer) number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;