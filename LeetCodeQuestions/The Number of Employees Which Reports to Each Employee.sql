SELECT e1.employee_id, e1.name, count(e2.reports_to) as reports_count, round(avg(e2.age),0) as average_age
from Employees e1 JOIN Employees e2
ON e1.employee_id = e2.reports_to
WHERE e2.reports_to is not null
GROUP BY e1.employee_id,e1.name
ORDER BY e1.employee_id;
