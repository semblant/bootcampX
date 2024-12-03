SELECT cohorts.name AS cohort, count(assignments_submissions.id) AS total_submissions FROM assignments_submissions
INNER JOIN students ON assignments_submissions.student_id = students.id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY count(assignments_submissions.id) DESC