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
     * order_reviews
 * Verified that no duplicate primary keys existed.
 * For order_items table, where one order can contain multiple products:
     * A composite key (order_id, order_item_id) was used.
     * Uniqueness of the composite key was validated.
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

**1. How has Revenue Evolved Over Time**

 * Revenue demonstrates consistent year-over-year growth, with strong acceleration in 2018 and a noticeable spike in the month of Novermber.
 * Late delivery rate generally ranges between 0-10%, indicating scalable logistics infrastructure. The highest spike in March 2018, not November (the highest revenue month) implies date deliveries during these months are due to other reasons, and not due to high total orders.
 * Late delivery reduces average review scores by approximately 1.7 stars, demonstrating a strong negative impact of operational delays on customer satisfaction.
 * Customer satisfaction does not meaningfully influence repeat purchase behaviour. There is no strong relationship between review score and number of orders.
 * There is a low repeat purchase rate (~3%), meaning a vast majority of customers make only a single purchase. This suggests low customer retention and highlights a potential opportunity for loyalty programs or retention strategies.


## Final Business Insights

## Strategic Recommendations

## Skills Demonstrated
