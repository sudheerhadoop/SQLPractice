select a.employee_id
from employees a
join employees b on a.manager_id = b.employee_id
join employees c on b.manager_id = c.employee_id
where a.employee_id != 1 and c.manager_id = 1;
