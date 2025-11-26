-- Select employees who earn more than their direct managers
SELECT 
    e.employee_id,              -- Employee ID
    e.name AS employee_name     -- Employee name
FROM 
    employee e                  -- 'e' = employee table (the worker)
JOIN 
    employee m                  -- 'm' = employee table again (the manager)
    ON e.manager_id = m.employee_id   -- Match employee's manager to the manager’s employee_id
WHERE 
    e.salary > m.salary;        -- Keep only employees earning more than their manager
