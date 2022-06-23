with cte as 
(
select 
delivery_id,
customer_id,
case when order_date = customer_pref_delivery_date then 'Immediate'
else 'scheduled' end as Delivery_Preference
from 
(
select 
delivery_id,
customer_id,
order_date, 
customer_pref_delivery_date,
rank() over (partition by customer_id order by order_date) as rn
from 
Delivery) inn 
where inn.rn=1)


select round((sum(case when Delivery_Preference='Immediate' then 1 else 0 end)/count(distinct customer_id))*100,2) as immediate_percentage
from 
cte
