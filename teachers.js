const { Pool } = require('pg');

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database:"bootcampx",
});

pool.query(
  `
  SELECT
    teachers.name as teacher,
    cohorts.name as cohort,
    COUNT(assistance_requests) AS total_assistances
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name = '${process.argv[2]}'
  GROUP BY teacher, cohort
  ORDER BY teacher;
  `
)
.then((res) => {
  res.rows.forEach((row) => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
})
.catch((err) => {
  console.log("query error:", err.stack);
})
