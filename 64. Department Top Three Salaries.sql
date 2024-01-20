# https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50


-- Table: Employee

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key (column with unique values) for this table.
-- departmentId is a foreign key (reference column) of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

-- Table: Department

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of a department and its name.
 

-- A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

-- Write a solution to find the employees who are high earners in each of the departments.

-- Return the result table in any order.


# Write your MySQL query statement below

WITH unique_salaries AS (
SELECT
    d.name AS Department,
    e.salary AS Salary,
    d.id AS d_id,
    ROW_NUMBER() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS row_num
FROM Department d
INNER JOIN Employee e
ON d.id = e.departmentId
GROUP BY d.name, e.salary
)

SELECT
    us.Department,
    e.name AS Employee, 
    us.Salary
FROM unique_salaries us
RIGHT JOIN Employee e
ON us.Salary = e.salary AND us.d_id = e.departmentId 
WHERE us.row_num <= 3;
