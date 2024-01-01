# Write your MySQL query statement below
SELECT *,
IF(x+y+z>2*(CASE
      WHEN x >= y AND x >= z THEN x
      WHEN y >= x AND y >= z THEN y
      WHEN z >= x AND z >= y THEN z
      ELSE 0
    END) , 'Yes', 'No') AS triangle
FROM Triangle
