with cte1 AS (select * from employee
where (id,month) NOT IN (select id,max(month) from employee group by id))

select id,month, sum(salary) over (partition by id order by month range between 2 preceding and current row) as Salary
from cte1 order by id, month desc
