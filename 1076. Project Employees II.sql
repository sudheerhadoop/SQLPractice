with projectcte as 
(
select 
project_id,
count(e.employee_id) over (partition by project_id) numofemploys
from project p 
join 
employee e 
on p.employee_id=e.employee_id)

select distinct project_id from 
projectcte 
where numofemploys in (
select max(numofemploys) 
from 
projectcte)
