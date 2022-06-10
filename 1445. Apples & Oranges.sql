with salescte as 
(
select 
    sale_date,
    sum(case when fruit='apples' then sold_num else 0 end) as apples_sales,
    sum(case when fruit='oranges' then sold_num else 0 end) as oranges_sales
from sales
group by 
    sale_date
)

select sale_date, apples_sales - oranges_sales as diff
from salescte 
order by sale_date
