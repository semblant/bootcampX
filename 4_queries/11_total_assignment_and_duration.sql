SELECT
  assignments.day,
  SUM(assignments.duration) AS duration,
  COUNT(assignments) AS number_of_assignments
FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;