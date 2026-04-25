CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

  RETURN (
      select distinct salary 
      from (
        select salary,
            dense_rank () over (order by salary desc) as salary_rank
        from Employee ) as ranked_salary
        where salary_rank = N    
      


  );
END
