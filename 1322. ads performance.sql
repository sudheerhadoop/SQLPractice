
with adcte as
(
select
    ad_id, 
    sum(case when action = 'Clicked' then 1 else 0 end) as noofclicks,
    sum(case when action = 'Viewed' then 1 else 0 end) as noofviews
from 
ads 
group by ad_id
)

select 
    ad_id, 
    case when 
    noofclicks+noofviews = 0 then 0 
    else round((noofclicks/(noofclicks+noofviews))*100,2) end as ctr
from 
adcte
order by ctr desc, ad_id
