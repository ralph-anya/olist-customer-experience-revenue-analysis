-- 1. How has revenue evolved over time, and are there seasonal/peak patterns?

WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS purchase_month,
        SUM(oi.price + oi.freight_value) AS total_revenue
    FROM orders AS o
    JOIN order_items AS oi
		ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY purchase_month
)

SELECT 
    purchase_month,
    total_revenue,
    SUM(total_revenue) OVER(ORDER BY purchase_month) AS cumulative_revenue
FROM monthly_revenue
ORDER BY purchase_month;


-- 2. What percentage of orders are delivered late?

WITH delivery_stats AS (
	SELECT
		DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS purchase_month,
		COUNT(*) AS total_orders,
		SUM(CASE
			WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 1
            ELSE 0
			END
			) AS late_delivery
		FROM olist.orders
		WHERE order_status = 'delivered'
		GROUP BY purchase_month
		ORDER BY purchase_month
)

SELECT 
	purchase_month,
	total_orders,
	late_delivery,
	ROUND(late_delivery * 100.0 / total_orders, 2) AS '%age_late_delivery'
 FROM delivery_stats;
 
 
 -- 3. How does delivery performance impact customer satisfaction (review scores)?
 
 SELECT 
	CASE
    WHEN order_delivered_customer_date > order_estimated_delivery_date
    THEN 'Late'
    ELSE 'On Time'
    END  AS delivery_status,
    AVG(review_score) as avg_review_score,
    COUNT(*) as review_count
    FROM order_reviews AS r
    JOIN orders AS o
		ON o.order_id = r.order_id
	WHERE order_status = 'delivered'
    GROUP BY delivery_status;
    
    
    -- 4. How does customer satisfaction influence repeat purchase behaviour? 
    
    WITH customer_reviews AS (
	SELECT
		customer_unique_id,
		AVG(review_score) AS avg_review_score
	FROM customers AS c
	JOIN orders AS o
		ON c.customer_id = o.customer_id
	JOIN order_reviews AS r
		ON r.order_id = o.order_id
	GROUP BY customer_unique_id
    ),
    
customer_orders AS (
	SELECT
		customer_unique_id,
		COUNT(order_id) AS order_count
	FROM customers AS c
	JOIN orders AS o
		ON c.customer_id = o.customer_id
	WHERE order_status = 'delivered'
	GROUP BY customer_unique_id
)

SELECT 
	CASE
		WHEN avg_review_score >= 4
		THEN 'High Satisfaction'
		ELSE 'Low Satisfaction'
	END AS satisfaction_level,
	AVG(order_count) AS avg_orders_per_customer
FROM customer_orders AS co
JOIN customer_reviews AS cr
	ON co.customer_unique_id = cr.customer_unique_id
GROUP BY satisfaction_level;


-- 5. What is the overall repeat purchase rate?

WITH customer_order_counts AS (
	SELECT
		customer_unique_id,
		COUNT(order_id) AS order_count
	FROM customers AS c
	JOIN orders AS o
		ON c.customer_id = o.customer_id
	WHERE order_status = 'delivered'
	GROUP BY customer_unique_id
)

SELECT
	COUNT(CASE WHEN order_count > 1
			THEN 1
            END) * 100 / COUNT(*) AS repeat_purchase_rate
FROM customer_order_counts;