
with projectcte as
(
select 
    p.project_id, 
    p.employee_id,
    e.experience_years
from 
project p
join
employee e
on p.employee_id = e.employee_id)

select project_id,
       employee_id
from 
(
select project_id,
       employee_id,
       dense_rank() over (partition by project_id order by experience_years desc) rn
from projectcte) inn 
where inn.rn = 1;
