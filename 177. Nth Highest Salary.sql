CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select max(salary) from 
      (select id, salary, dense_rank() over (order by salary desc) as rn from Employee ) a
      where rn = N
  );
END
