with salescte as
(select seller_id,
sum(price) as total_sales
from 
Sales 
group by seller_id)

select seller_id 
from
(select seller_id, 
rank() over (order by total_sales desc) rn
from salescte ) inn
where inn.rn =1;


/******************/
select a.seller_id
from
(select seller_id, sum(price), dense_rank() over(order by sum(price) desc) as 'rank'
from Sales
group by seller_id) a
where a.rank = 1
