-- Checking NULLs on relevant table columns

-- 1. customers table

SELECT
	COUNT(*)
FROM customers
WHERE customer_id IS NULL;

SELECT
	COUNT(*)
FROM customers
WHERE customer_unique_id IS NULL;

-- 2. orders table

SELECT
	COUNT(*)
FROM orders
WHERE order_id IS NULL;

SELECT
	COUNT(*)
FROM orders
WHERE customer_id IS NULL;

SELECT
	COUNT(*)
FROM orders
WHERE order_status IS NULL;

-- For order_delivered_customer_date field, almost all NULL values corresponded to orders not yet delivered, and these records were excluded from delivery performance analysis (An insignificant percentage (0.0083%) of NULL delivery dates had delivered orders, which was ignored during analysis)

SELECT
	COUNT(*)
FROM orders
WHERE order_delivered_customer_date IS NULL;

SELECT
	COUNT(*)
FROM orders
WHERE order_estimated_delivery_date IS NULL;

-- 3. order_items table

SELECT
	COUNT(*)
FROM order_items
WHERE order_id IS NULL;

SELECT
	COUNT(*)
FROM order_items
WHERE order_item_id IS NULL;

SELECT
	COUNT(*)
FROM order_items
WHERE price IS NULL;

SELECT
	COUNT(*)
FROM order_items
WHERE freight_value IS NULL;

-- 4. order_reviews table

SELECT
	COUNT(*)
FROM order_reviews
WHERE order_id IS NULL;

SELECT
	COUNT(*)
FROM order_reviews
WHERE review_id IS NULL;

SELECT
	COUNT(*)
FROM order_reviews
WHERE review_score IS NULL;
