-- 1. customers table

SELECT
	customer_id,
	COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. orders table

SELECT 
	order_id,
    COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 3. order_items table

SELECT
	order_id,
    order_item_id,
    COUNT(*)
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;

-- 4. order_reviews table

SELECT
	order_id,
    review_id,
	COUNT(*)
FROM order_reviews
GROUP BY order_id, review_id
HAVING COUNT(*) > 1;