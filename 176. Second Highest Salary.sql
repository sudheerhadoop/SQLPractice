select salary as SecondHighestSalary from (select salary, 
dense_rank() over(order by salary desc) rn from employee) emp where emp.rn=2;
