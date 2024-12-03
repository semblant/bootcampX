SELECT cohorts.name AS cohort_name, count(students.id) AS student_count
FROM cohorts
INNER JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(students.id) >= 18
ORDER BY count(students.id);