# https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50

#Table: Logs

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | num         | varchar |
# +-------------+---------+
# In SQL, id is the primary key for this table.
# id is an autoincrement column.
 

# Find all numbers that appear at least three times consecutively.

# Return the result table in any order.

# Write your MySQL query statement below
WITH helper AS (
SELECT
    l1.id AS id,
    l1.num AS n1,
    l2.num AS n2,
    IF(l1.num = l2.num, l1.num, null) AS number
FROM Logs AS l1
LEFT JOIN Logs AS l2
ON l1.id = l2.id + 1
)
SELECT DISTINCT h1.number AS ConsecutiveNums
FROM helper AS h1
LEFT JOIN helper as h2
ON h1.id = h2.id + 1
WHERE h1.number = h2.number; 

