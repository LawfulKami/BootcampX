const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const value = [`${args[0]}`];

const queryString = `SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students on students.id = student_id
JOIN cohorts on cohorts.id = cohort_id
WHERE cohorts.name = $1
ORDER BY teachers.name;
`;

pool.query(queryString, value)
  .then(res => {
    res.rows.forEach(teachers => {
      const { teacher, cohort } = teachers;
      console.log(`${cohort}: ${teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));

  