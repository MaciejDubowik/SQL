# https://leetcode.com/problems/the-latest-login-in-2020/description/

# Table: Logins

# +----------------+----------+
# | Column Name    | Type     |
# +----------------+----------+
# | user_id        | int      |
# | time_stamp     | datetime |
# +----------------+----------+
# (user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
# Each row contains information about the login time for the user with ID user_id.
 

# Write a solution to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.

# Return the result table in any order.

# Write your MySQL query statement below
SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp BETWEEN '2020-01-01 00:00:00' AND '2020-12-31 23:59:59'
GROUP BY user_id;

