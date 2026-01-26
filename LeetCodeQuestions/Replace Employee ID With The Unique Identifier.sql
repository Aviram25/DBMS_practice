select unique_id, name
from EmployeeUNI e1 right join Employees e2 
on e1.id = e2.id;
