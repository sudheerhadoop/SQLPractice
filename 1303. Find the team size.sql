select e.employee_id, e1.team_size 
from 
employee e
join 
(select team_id, count(*) as team_size 
from 
employee 
group by team_id) e1
on e.team_id = e1.team_id;
