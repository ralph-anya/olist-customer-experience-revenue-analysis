-- 1. Create customers table

CREATE TABLE customers (
customer_id VARCHAR(50),
customer_unique_id VARCHAR(50),
customer_zip_code_prefix INT,
customer_city VARCHAR(100),
customer_state VARCHAR(10)
);

LOAD DATA LOCAL INFILE 'C:/Users/USER/Desktop/MySQL/Olist_dataset/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 2. Creating orders table and populating table. 

CREATE TABLE orders (
order_id VARCHAR(50),
customer_id VARCHAR(50),
order_status VARCHAR(20),
order_purchase_timestamp DATETIME,
order_approved_at DATETIME,
order_delivered_carrier_date DATETIME,
order_delivered_customer_date DATETIME,
order_estimated_delivery_date DATETIME
);

LOAD DATA LOCAL INFILE 'C:/Users/USER/Desktop/MySQL/Olist_dataset/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id,
 customer_id,
 order_status,
 @purchase,
 @approved,
 @carrier,
 @delivered,
 @estimated)
SET
order_purchase_timestamp = NULLIF(@purchase,''),
order_approved_at = NULLIF(@approved,''),
order_delivered_carrier_date = NULLIF(@carrier,''),
order_delivered_customer_date = NULLIF(@delivered,''),
order_estimated_delivery_date = NULLIF(@estimated,'');


 -- 3. Create order_items table
 
 CREATE TABLE order_items (
 order_id VARCHAR(50),
 order_item_id INT,
 product_id VARCHAR(50),
 seller_id VARCHAR(50), 
 shipping_limit_date DATETIME,
 price DECIMAL(10,2),
 freight_value DECIMAL(10,2)
 );
 
 
 -- 4. Create order_reviews table
 
 CREATE TABLE order_reviews (
 review_id VARCHAR(50),
 order_id VARCHAR(50),
 review_score INT,
 review_comment_title TEXT,
 review_comment_message TEXT,
 review_creation_date DATETIME,
 review_answer_timestamp DATETIME
 );
 
LOAD DATA LOCAL INFILE 'C:/Users/USER/Desktop/MySQL/Olist_dataset/csv_files/order_reviews.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id,
order_id,
review_score,
review_comment_title,
review_comment_message,
@review_creation_date,
@review_answer_timestamp)
SET
review_creation_date = STR_TO_DATE(@review_creation_date, '%Y-%m-%d %H:%i:%s'),
review_answer_timestamp = STR_TO_DATE(@review_answer_timestamp, '%Y-%m-%d %H:%i:%s');
