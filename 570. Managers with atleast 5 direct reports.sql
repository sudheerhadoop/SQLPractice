select name from 
employee where 
id in (
select managerId 
from employee
group by managerId 
having count(*) >= 5);
