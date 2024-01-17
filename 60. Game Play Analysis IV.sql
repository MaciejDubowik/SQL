# https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.


# Write your MySQL query statement below

# będziemy musieli rozbić sobie to zadanie na trzy zapytania:
# 1. znajdzie date pierwszego logowania dla każdego użytkownika
# 2. będzie sprawdzać czy dany gracz się zalogował min 2dni pod rząd i zwróci nam liczbę takich graczy
# 3. zwróci wynik aktywni gracze / wszyscy gracze

# Ad.1
WITH player_first_login AS (
SELECT player_id, MIN(event_date) AS min_date
FROM Activity
GROUP BY player_id
), 
#Ad.2
playersWithDayStreak AS (
    SELECT COUNT(p.player_id) AS players_count
    FROM player_first_login p
    LEFT JOIN Activity a ON DATEDIFF(a.event_date, p.min_date) = 1 AND p.player_id = a.player_id
    WHERE a.player_id IS NOT NULL
)
#Ad.3
SELECT ROUND(p.players_count / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM Activity a, playersWithDayStreak p



