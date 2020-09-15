SELECT assignments.id AS id, assignments.name, day AS name, chapter, COUNT(assistance_requests.id) AS total_requests
FROM assistance_requests
JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;
