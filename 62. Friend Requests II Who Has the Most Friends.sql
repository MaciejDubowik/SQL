# https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50

-- Table: RequestAccepted

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

-- Write a solution to find the people who have the most friends and the most friends number.

-- The test cases are generated so that only one person has the most friends.

# Write your MySQL query statement below
SELECT id, SUM(friends_counter) AS num
FROM (
SELECT requester_id AS id, COUNT(requester_id) AS friends_counter
FROM RequestAccepted
GROUP BY requester_id

UNION ALL

SELECT accepter_id AS id, COUNT(accepter_id ) AS friends_counter
FROM RequestAccepted
GROUP BY accepter_id 
) AS union_tables

GROUP BY id
ORDER BY SUM(friends_counter)  DESC
LIMIT 1;


