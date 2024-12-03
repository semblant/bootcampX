SELECT students.name AS student, AVG(assignments_submissions.duration) AS average_assignment_duration
FROM students
INNER JOIN assignments_submissions ON students.id = assignments_submissions.student_id
WHERE students.end_date IS NULL -- currently enrolled students
GROUP BY students.name
ORDER BY AVG(assignments_submissions.duration) DESC;