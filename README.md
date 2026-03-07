# Customer Exprerience & Revenue Performance Analysis of Olist E-Commerce Platform

## Project Overview

Olist is a Brazilian e-commerce marketplace connecting small businnesses to customers. This project investigates how customer experience indicators (delivery performance and review scores) influence revenue performance and sustainability within the Olist marketplace.

This SQL-based analysis connects revenue trends, delivery performance, customer satisfaction and repeat purchase behaviour.

## Business Questions

1. How has revenue evolved over time, and are there seasonal/peak patterns?
2. What percentage of orders are delivered late, and does late delivery increase during high-revenue periods?
3. How does delivery performance impact customer satisfaction (review scores)?
4. How does customer satisfaction influence repeat purchase behaviour?
5. What is the overall customer repeat purchase rate, and what does it imply about revenue sustainability?

## Dataset Overview

 * Dataset: Brazilian E-Commerce Public Dataset by Olist. (Can be accessed via this link [olist_dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce))
 * Source: Kaggle
 * Tables used:
     * orders
     * order_items
     * order_reviews
     * customers

## Data Handling & Preparation

### Data Importation

 * Created relational tables
 * Defined appropriate data types

***provide a screenshotted example here***

### Data Cleaning & Validation

 **1. Duplicate and Primary Key Validation**
 
To ensure transactional integrity and prevent revenue distortion, primary identifiers were validated across all relevant tables.

 * Checked uniqueness of primary keys in:
     * customers
     * orders
 * Verified that no duplicate primary keys existed.
 * For order_items table, where one order can contain multiple products:
     * A composite key (order_id, order_item_id) was used.
     * Same was done for the order_reviews table (review_id, order_id used as composite key).
     * Uniqueness of the composite keys were validated.
     * Confirmed no duplicate composite records.

  **2. NULL Value Assessment and Handling**

Columns were checked for nulls based on analytical impact. Primary and foreign keys were validated for completeness to preserve relational integrity. Other fields related to revenue and customer experience, such as price, freight_value, review_score, delivery_timestamps, were checked for missing values due to their influence on KPI calculations.

 * No NULL values existed in primary keys, price, freight_value and review_scores fields.
 * Identified NULLs in delivery dates. Almost all NULL delivery dates corresponded to orders not yet delivered, and these records were excluded from delivery performance analysis (An insignificant percentage (0.0083%) of NULL delivery dates had delivered orders, which was ignored during analysis). Revenue calculations included completed orders only.
 * Analytical filtering was applied instead of deleting records.
 * No structural deletions were performed to maintain raw dataset integrity.

  **3. Referential Integrity Validation**  

To ensure accurate relational joins and prevent data distortion during analysis, foreign key relationships were validated across core transactional tables.

## Key Findings 

 * Revenue demonstrates consistent year-over-year growth, with strong acceleration in 2018 and a noticeable spike in the month of November.

<img width="1120" height="550" alt="running_total_small" src="https://github.com/user-attachments/assets/2d70ee8f-289f-4df5-b75a-c7ce6150cbdb" />

<img width="1338" height="820" alt="monthly_revenue" src="https://github.com/user-attachments/assets/ebe0211e-2051-473d-85eb-2ca2e0258c01" />    

 * Late delivery rate generally ranges between 0-10%, indicating scalable logistics infrastructure. The highest spike in March 2018, not November (the highest revenue month) implies late deliveries during these months are due to other reasons, and not due to high total orders. (The first month, that is 2016-09 with a delivery rate of 100%, was ignored as it involved just one delivered order, which turned out to be a late delivery as well).

<img width="1132" height="428" alt="monthly_late_delivery_small" src="https://github.com/user-attachments/assets/8e7ae898-412b-4915-9771-4553f0a0e156" />

 * Late delivery reduces average review scores by approximately 1.7 stars, demonstrating a strong negative impact of operational delays on customer satisfaction.

<img width="626" height="380" alt="average_review_score_small" src="https://github.com/user-attachments/assets/c4700242-7a65-4f5b-9921-0b3b2516b747" />

 * Customer satisfaction does not meaningfully influence repeat purchase behaviour. There is no strong relationship between review score and number of orders.

<img width="544" height="326" alt="avg_orders_per_customer_small" src="https://github.com/user-attachments/assets/b1278d49-8ae3-43c6-9f35-e79186d86c66" />

 * There is a low repeat purchase rate (~3%), meaning a vast majority of customers make only a single purchase. This suggests low customer retention and highlights a potential opportunity for loyalty programs or retention strategies.
   
            |repeat_purchase_rate|
            |--------------------|
            |3.0003              |

## Final Business Insights

* Olist is experiencing a strong demand growth and market expansion, with peak sales periods significantly contributing to annual revenue.
* Delivery delays are not primarily driven by high order volume, but likely by operational inefficiencies or external disruptions such as warehouse processing days, courier partner performance, etc.
* Late delivery is one of the most influential factors affecting customer experience on the platform.
* Customer satisfaction does not automatically translate into repeat buying behaviour. Customers may be purchasing based on product availability, pricing, etc.
* A 3% repeat purchase rate implies the business relies heavily on new customer acquisition rather than repeat customers, indicating limited customer loyalty. As such, revenue sustainability is at risk if retention is not improved.
  
## Strategic Recommendations

 * Olist should strategically plan inventory, marketing campaigns and logistics capacity around high demand periods such as November.
 * Conduct operational diagnostics to identify root causes of late deliveries during non-peak periods.
 * Focus on retention programs such as customer loyalty programs, offering incentives for second purchases, etc.
 * Run marketing campaigns targeting past buyers.
   
## Skills Demonstrated

 * Advanced SQL querying
     * Data Cleaning
     *  Multi-CTEs
     *  CASE logic
     *  Window functions
     *  Multi-table joins
     *  Agggregations
 * Business problem translation
 * Customer retention analysis
 * Revenue performance analysis
 * Data-driven recommendation development
 * Data storytelling

## Tools Used

 * MySQL
 * Excel
