select s.id as id, s.name as name from
students s left join departments d
on s.department_id=d.id 
where d.id is null;



SELECT id, name FROM Students
WHERE department_id not in (SELECT id from Departments)
