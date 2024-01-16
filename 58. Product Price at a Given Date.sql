-- https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50

-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.

# Write your MySQL query statement below
WITH date_helper AS (
SELECT *, MAX(change_date) AS correct_date
FROM Products
WHERE change_date <= '2019-08-16'
GROUP BY product_id
)
SELECT p.product_id, IF(dh.correct_date IS NULL, 10, p.new_price) AS price
FROM Products AS p
LEFT JOIN date_helper AS dh
ON p.product_id = dh.product_id
WHERE p.change_date = dh.correct_date OR dh.correct_date IS NULL
GROUP BY product_id;