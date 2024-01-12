# https://leetcode.com/problems/rank-scores/

# Table: Scores

# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | score       | decimal |
# +-------------+---------+
# id is the primary key (column with unique values) for this table.
# Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
 

# Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

# The scores should be ranked from the highest to the lowest.
# If there is a tie between two scores, both should have the same ranking.
# After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
# Return the result table ordered by score in descending order.

# Write your MySQL query statement below
WITH score_ranking AS (
   SELECT
   score,
   ROW_NUMBER() OVER(ORDER BY score DESC) AS ranking
   FROM Scores
   GROUP BY score
)
SELECT
    s.score,
    sr.ranking AS 'rank'
FROM Scores AS s
INNER JOIN score_ranking AS sr
ON s.score = sr.score
GROUP BY s.id
ORDER BY s.score DESC;