# https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

# Table: Weather

# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | id            | int     |
# | recordDate    | date    |
# | temperature   | int     |
# +---------------+---------+
# id is the column with unique values for this table.
# This table contains information about the temperature on a certain day.
 

# Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

# Return the result table in any order.

# Write your MySQL query statement below
SELECT w2.id
FROM Weather w1
LEFT JOIN Weather w2
ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w1.temperature < w2.temperature;

