with subcte as
(
select student_id, student_name, subject_name 
from students stu, subjects sub 
)

select s.student_id, s.student_name, s.subject_name, coalesce(e.nooftimes, 0) as attended_exams 
from subcte s 
left join 
(select student_id, subject_name, count(*) as nooftimes
 from examinations
 group by student_id, subject_name) e on
s.student_id = e.student_id
and 
s.subject_name = e.subject_name
group by student_id, student_name, subject_name
order by student_id, subject_name;
