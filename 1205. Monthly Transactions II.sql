
with cte as 
(
select distinct c.trans_id, t.country, 'chargeback' as state, t.amount, c.trans_date
from 
chargebacks c
left join 
transactions t
on c.trans_id = t.id

UNION ALL

select * from transactions where state='approved'
)


select 
    coalesce(left(trans_date, 7)) as month, 
    country,
    sum(case when state='approved' then 1 else 0 end) as approved_count,
    sum(case when state='approved' then amount else 0 end) as approved_amount,
    sum(case when state='chargeback' then 1 else 0 end) as chargeback_count,
    sum(case when state='chargeback' then amount else 0 end) as chargeback_amount
from 
cte
group by 1,2
