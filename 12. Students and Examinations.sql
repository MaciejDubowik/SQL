# https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50

# Write your MySQL query statement below

# SELECT
#     s.student_id,
#     s.student_name,
#     e.subject_name,
#     COUNT(s.student_name) AS attended_exams
# FROM Students AS s
# LEFT JOIN Examinations AS e
# ON s.student_id = e.student_id
# GROUP BY s.student_name, e.subject_name

# FIRST STEP - join two tables with all possibilities
SELECT 
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(exm.subject_name) AS attended_exams
FROM Students AS stu
CROSS JOIN Subjects AS sub

# SECOND STEP - match with examinations table
LEFT JOIN Examinations AS exm
ON stu.student_id = exm.student_id AND sub.subject_name = exm.subject_name
GROUP BY student_name, subject_name
ORDER BY stu.student_id, sub.subject_name ASC;