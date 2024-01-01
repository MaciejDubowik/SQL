# https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

# Table: Employees

# +-------------+----------+
# | Column Name | Type     |
# +-------------+----------+
# | employee_id | int      |
# | name        | varchar  |
# | reports_to  | int      |
# | age         | int      |
# +-------------+----------+
# employee_id is the column with unique values for this table.
# This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

# For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

# Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

# Return the result table ordered by employee_id.

# Write your MySQL query statement below
WITH grouped_reports AS(
    SELECT
        *,
        COUNT(reports_to) AS reports_count,
        ROUND(AVG(age),0) AS average_age
    FROM Employees
    GROUP BY reports_to
)
SELECT
    e.employee_id,
    e.name,
    gr.reports_count,
    gr.average_age
FROM 
    Employees AS e
INNER JOIN grouped_reports AS gr
ON e.employee_id = gr.reports_to
ORDER BY e.employee_id ASC;
