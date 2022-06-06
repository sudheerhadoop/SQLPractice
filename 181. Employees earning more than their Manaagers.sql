select e1.name as employee from employee e1 join employee e2 on e1.managerid = e2.id and e1.salary > e2.salary;
