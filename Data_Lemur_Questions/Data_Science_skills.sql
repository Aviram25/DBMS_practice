-- Select candidates who have ALL three required skills:
-- Python, Tableau, and PostgreSQL
SELECT 
    candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
-- HAVING ensures the candidate has all 3 distinct skills
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
