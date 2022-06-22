with cte as 
(select buyer_id, product_name from Sales s left join Product p on s.product_id = p.product_id) 

select distinct buyer_id from cte where product_name = "S8" and buyer_id not in (select buyer_id from cte where product_name = "iPhone");
