SELECT 
    salary AS second_highest_salary
    -- Rename the output column for clarity

FROM employee
-- Source table containing employee salaries

ORDER BY salary DESC
-- Sort salaries from highest to lowest

OFFSET 1
-- Skip the highest salary (first row)

LIMIT 1;
-- Return only the next salary → the second highest
