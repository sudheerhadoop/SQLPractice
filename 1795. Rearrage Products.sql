select * from
(select product_id, 'store1' as store, store1 as price from Products
union
select product_id, 'store2' as store, store2 as price from Products
union
select product_id, 'store3' as store, store3 as price from Products) t
where price is not null


----------------------------------------------------------------------------

SELECT
    product_id,
    'store1' AS store,
    store1 AS price
FROM Products
WHERE store1 IS NOT NULL
    
UNION ALL

SELECT
    product_id,
    'store2' AS store,
    store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT
    product_id,
    'store3' AS store,
    store3 AS price
FROM Products
WHERE store3 IS NOT NULL
