SELECT SUM(assignments_submissions.duration) AS total_duration
FROM assignments_submissions
INNER JOIN students ON students.id = assignments_submissions.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'FEB12';