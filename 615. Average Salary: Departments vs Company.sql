with salarycte as 
(
select concat(left(pay_date, 4), '-',substring(pay_date, 6,2)) as paymonth,
e.department_id as dept_id,
amount as salary
from salary s
left join 
employee e 
on s.employee_id = e.employee_id
)
, avgsal as (
select paymonth,
    dept_id,
    avg(salary) over(partition by paymonth) as monthly_average,
    avg(salary) over(partition by paymonth,dept_id) as department_avg
from salarycte)

select distinct paymonth as pay_month,
    dept_id as department_id,
    case when department_avg > monthly_average then 'higher'
    when department_avg < monthly_average then 'lower'
    else 'same' end as comparison
from avgsal
order by paymonth desc, dept_id;
