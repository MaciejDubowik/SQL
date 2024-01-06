# https://leetcode.com/problems/employees-with-missing-information/description/

#Table: Employees

#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| employee_id | int     |
#| name        | varchar |
#+-------------+---------+
#employee_id is the column with unique values for this table.
#Each row of this table indicates the name of the employee whose ID is employee_id.
 

#Table: Salaries

#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| employee_id | int     |
#| salary      | int     |
#+-------------+---------+
#employee_id is the column with unique values for this table.
#Each row of this table indicates the salary of the employee whose ID is employee_id.
 

#Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:

#The employee's name is missing, or
#The employee's salary is missing.
#Return the result table ordered by employee_id in ascending order.


SELECT e.employee_id
FROM Employees AS e
LEFT JOIN Salaries AS s ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL

UNION

SELECT s.employee_id
FROM Employees AS e
RIGHT JOIN Salaries AS s ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL

ORDER BY employee_id ASC;