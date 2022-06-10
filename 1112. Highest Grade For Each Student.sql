select
student_id,
course_id,
grade
from
(select 
student_id,
course_id,
grade,
row_number() over (partition by student_id order by grade desc, course_id) rn
from enrollments) inn 
where inn.rn=1
order by student_id;
