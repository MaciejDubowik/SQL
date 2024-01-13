#https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50

# Table: Movies

# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | movie_id      | int     |
# | title         | varchar |
# +---------------+---------+
# movie_id is the primary key (column with unique values) for this table.
# title is the name of the movie.
 

# Table: Users

# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | user_id       | int     |
# | name          | varchar |
# +---------------+---------+
# user_id is the primary key (column with unique values) for this table.
 

# Table: MovieRating

# +---------------+---------+
# | Column Name   | Type    |
# +---------------+---------+
# | movie_id      | int     |
# | user_id       | int     |
# | rating        | int     |
# | created_at    | date    |
# +---------------+---------+
# (movie_id, user_id) is the primary key (column with unique values) for this table.
# This table contains the rating of a movie by a user in their review.
# created_at is the user's review date. 
 

# Write a solution to:

# Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
# Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

# Write your MySQL query statement below
(
SELECT u.name AS results
FROM Users AS u
INNER JOIN MovieRating AS mr
ON u.user_id = mr.user_id
GROUP BY u.user_id
ORDER BY COUNT(mr.rating) DESC, u.name
LIMIT 1
)
UNION ALL
(
SELECT m.title AS results
FROM Movies AS m 
INNER JOIN MovieRating AS mr
ON m.movie_id = mr.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1
) 
