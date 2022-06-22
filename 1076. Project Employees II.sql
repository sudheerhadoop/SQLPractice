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


/***********/

select t.project_id from (select 
t.project_id,
rank() over(order by t.cnt desc) as res 
from (select 
p.project_id,
count(*) as cnt
from Project as p inner join Employee as e
	on e.employee_id = p.employee_id
group by 1) as t) as t
where t.res = 1
