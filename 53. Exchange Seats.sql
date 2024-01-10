# https://leetcode.com/problems/exchange-seats/

# Table: Seat

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | student     | varchar |
# +-------------+---------+
# id is the primary key (unique value) column for this table.
# Each row of this table indicates the name and the ID of a student.
# id is a continuous increment.
 

# Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

# Return the result table ordered by id in ascending order.

# Write your MySQL query statement below
SELECT
    CASE
        WHEN id = (SELECT MAX(id) FROM seat) AND id % 2 != 0 THEN id
        WHEN id % 2 != 0 THEN id + 1
        ELSE id - 1
    END AS 
    id, student
FROM Seat
ORDER BY id;
