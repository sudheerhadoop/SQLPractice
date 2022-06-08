select p.product_name,
sum(o.unit) as unit
from Products p
join Orders o
on p.product_id = o.product_id
where Left(order_date, 7) = '2020-02'
group by p.product_name
having sum(o.unit) >= 100;



select p.product_name, sum(unit) as unit
from orders o 
join 
products p on o.product_id=p.product_id
where left(order_date,7)='2020-02'
group by p.product_name
having sum(unit) >= 100;
