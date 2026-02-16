select d.name as Department, e.name as Employee, e.salary as Salary
from (
    select name, salary, departmentID,
           dense_rank() over (partition by departmentId order by salary DESC) as rn
    from Employee
) e
join Department d on e.departmentId = d.id
where e.rn = 1;
