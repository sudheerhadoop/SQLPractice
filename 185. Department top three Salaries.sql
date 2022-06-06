select d.name as Department, e.name as Employee, e.salary as Salary from 
(select name, 
 departmentid,
salary,
dense_rank() over(partition by departmentid order by salary desc) rn 
from employee) e  join department d on e.departmentid=d.id where e.rn<=3;
