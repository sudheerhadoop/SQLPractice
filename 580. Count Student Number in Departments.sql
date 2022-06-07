select d.dept_name, count(student_id) as student_number 
from department d 
left join 
student s 
on d.dept_id=s.dept_id 
group by d.dept_name
order by student_number desc, dept_name;
