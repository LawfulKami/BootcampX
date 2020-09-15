SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(teachers.name) as total_assistance
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students on students.id = student_id
JOIN cohorts on cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;