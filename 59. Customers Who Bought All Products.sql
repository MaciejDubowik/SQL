# https://leetcode.com/problems/customers-who-bought-all-products/?envType=study-plan-v2&envId=top-sql-50

-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+
-- This table may contain duplicates rows. 
-- customer_id is not NULL.
-- product_key is a foreign key (reference column) to Product table.
 

-- Table: Product

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+
-- product_key is the primary key (column with unique values) for this table.
 

-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

-- Return the result table in any order.

# Write your MySQL query statement below





# Jako, że oczekują od nas abyśmy znaleźli Klientów którzy zakupili wszystkie przedmioty to możemy rozwiązać zadanie następująco:

#1. Policzymy ile jest wszystkich przedmiotów
#2. Policzmy ile jest kupionych unikalnych produktów przez każdego klienta
#3. Zwrócimy customer_id dla tych wartości które będą równe

#Ad.1
WITH total_products AS (
    SELECT COUNT(product_key) AS total
    FROM Product
)
# Ad.2
SELECT customer_id
FROM Customer
GROUP BY customer_id

#Ad.3
HAVING COUNT(DISTINCT product_key) = (SELECT total FROM total_products);