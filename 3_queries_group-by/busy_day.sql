SELECT day, COUNT(*) as total_assignements
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day;