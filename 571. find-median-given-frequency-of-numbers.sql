select avg(n.num) as median from 
numbers n
where n.frequency >=
abs((select sum(frequency) from numbers n1 where n1.num <= n.num) -
(select sum(frequency) from numbers n2 where n2.num >= n.num));



/*******************Easy to Understand *************/
Get the middle two numbers' indexes by floor((sum(frequency) + 1) / 2), floor((sum(frequency) + 2) / 2). E.g.,

if sum(frequency) == 12, then the middle indexes are 6, 7, and if
sum(frequency) == 13, then the middle indexes are 7, 7, i.e., the same number.
Then get average of numbers from these two indexes.

WITH cte AS (SELECT floor((sum(frequency) + 1) / 2) AS m1
    , FLOOR((SUM(frequency) + 2) / 2) AS m2
FROM numbers )
    , cte2 AS (select number
    , SUM(frequency) OVER (ORDER BY number ROWS UNBOUNDED PRECEDING) AS presum
FROM numbers )
    , n1 AS ( SELECT number 
FROM cte2 WHERE presum >= (SELECT m1 FROM cte) LIMIT 1)
    , n2 AS ( SELECT number 
FROM cte2 WHERE presum >= (SELECT m2 FROM cte) LIMIT 1)

SELECT AVG(number) AS median 
FROM (select * FROM n1 UNION SELECT * FROM n2) t
