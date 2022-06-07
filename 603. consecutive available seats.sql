select distinct a.seat_id
from cinema a join cinema b
  on abs(a.seat_id - b.seat_id) = 1
  and a.free = true and b.free = true
order by a.seat_id
;




SELECT seat_id
FROM cinema
WHERE free = 1 AND (
    seat_id - 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
    OR
    seat_id + 1 IN (SELECT seat_id FROM cinema WHERE free = 1)
);



SELECT
    seat_id
FROM
    (SELECT
        seat_id,
        free,
        LAG(free,1) OVER (ORDER BY seat_id) as free_lag,
        LEAD(free,1) OVER (ORDER BY seat_id) as free_lead
    FROM cinema ) as t
WHERE (free=1 AND free_lag=1)
OR (free=1 AND free_lead=1)
;
