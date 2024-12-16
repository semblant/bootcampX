const { Pool } = require('pg');

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database:"bootcampx",
});

const args = process.argv.slice(2);

const queryString = `
  SELECT
    students.id AS student_id,
    students.name AS name,
    cohorts.name AS cohort
  FROM students
  LEFT JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// Store all potentially malicious vlaues in an array
const values = [`%${cohortName}%`, limit];

pool.query(queryString , values)
.then((res) => {
  res.rows.forEach((user) => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`)
  })
})
.catch((err) => {
  console.log("query error:", err.stack);
});