select * from
(select product_id, 'store1' as store, store1 as price from Products
union
select product_id, 'store2' as store, store2 as price from Products
union
select product_id, 'store3' as store, store3 as price from Products) t
where price is not null
