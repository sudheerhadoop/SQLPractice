select d.name as department,inn.name as Employee, salary from (select e.departmentid,e.salary as salary, e.name as name,
dense_rank() over (partition by departmentid order by salary desc) as rn 
from employee e) inn 
join department d on inn.departmentid=d.id
where inn.rn=1;  
