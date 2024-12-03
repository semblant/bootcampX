SELECT
    students.name AS student,
    AVG(assignments_submissions.duration) AS average_assignment_duration,
    AVG(assignments.duration) AS average_estimated_duration
FROM students

INNER JOIN assignments_submissions
    ON assignments_submissions.student_id = students.id

INNER JOIN assignments
    ON assignments.id = assignments_submissions.assignment_id

WHERE students.end_date IS NULL

GROUP BY students.name

HAVING AVG(assignments_submissions.duration) < AVG(assignments.duration)

ORDER BY AVG(assignments.duration) ASC;