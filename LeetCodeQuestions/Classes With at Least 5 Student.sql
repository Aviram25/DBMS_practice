SELECT class
FROM Courses 
Group by class
HAVING COUNT(DISTINCT student) >= 5;
