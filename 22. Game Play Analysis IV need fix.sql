# Write your MySQL query statement below


WITH total_players AS (
    SELECT COUNT(DISTINCT player_id) AS total
    FROM Activity
)
SELECT
    ROUND(IF(DATE_ADD(a1.event_date, INTERVAL 1 DAY) = a2.event_date , 1, 0)/tp.total, 2) AS fraction
FROM
    total_players AS tp,
    Activity AS a1
INNER JOIN
    Activity AS a2
ON
    a1.player_id = a2.player_id
    AND a1.device_id = a2.device_id
    AND a1.event_date < a2.event_date
GROUP BY
    a1.player_id, a1.event_date;
