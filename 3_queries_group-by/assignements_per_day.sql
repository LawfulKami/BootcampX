SELECT day, COUNT(*) as total_assignements
FROM assignments
GROUP BY day
ORDER BY day;