with emprows as 
(select 
id,
company,
salary,
row_number() over (partition by company order by salary) as rn,
count(1) over (partition by company) as row_count
from employee)

select id,company,salary 
from emprows 
where rn between row_count*1.0/2 and row_count*1.0/2+1;
