# https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50

#Table Prices

# +---------------+---------+
#  Column Name    Type    
# +---------------+---------+
#  product_id     int     
#  start_date     date    
#  end_date       date    
#  price          int     
# +---------------+---------+
# (product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
# Each row of this table indicates the price of the product_id in the period from start_date to end_date.
# For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

# Table UnitsSold

# +---------------+---------+
#  Column Name    Type    
# +---------------+---------+
#  product_id     int     
#  purchase_date  date    
#  units          int     
# +---------------+---------+
# This table may contain duplicate rows.
# Each row of this table indicates the date, units, and product_id of each product sold. 
 

# Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.

# Return the result table in any order.

# Write your MySQL query statement below
SELECT 
    p.product_id,
    CASE 
        WHEN us.purchase_date IS NULL THEN 0
        ELSE ROUND(SUM(p.price  us.units)SUM(us.units),2)
    END AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS us
ON p.product_id = us.product_id
WHERE us.purchase_date BETWEEN p.start_date AND p.end_date OR us.purchase_date IS NULL
GROUP BY p.product_id;
