# https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

# Table: Employee

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | name        | varchar |
# | department  | varchar |
# | managerId   | int     |
# +-------------+---------+
# id is the primary key (column with unique values) for this table.
# Each row of this table indicates the name of an employee, their department, and the id of their manager.
# If managerId is null, then the employee does not have a manager.
# No employee will be the manager of themself.
 

# Write a solution to find managers with at least five direct reports.

# Return the result table in any order.

# Write your MySQL query statement below
SELECT e2.name
FROM Employee AS e1
INNER JOIN Employee AS e2
ON e2.id = e1.managerId
GROUP BY e1.managerId
HAVING COUNT(e1.managerId) >= 5;



