# https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50

# Table: Employee

# +-------------+------+
# | Column Name | Type |
# +-------------+------+
# | id          | int  |
# | salary      | int  |
# +-------------+------+
# id is the primary key (column with unique values) for this table.
# Each row of this table contains information about the salary of an employee.
 

# Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

# Write your MySQL query statement below
SELECT 
    (SELECT DISTINCT Salary
     FROM Employee
     ORDER BY Salary DESC
     LIMIT 1, 1) AS SecondHighestSalary;
