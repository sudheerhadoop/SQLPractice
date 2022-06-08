
with friendscte as (
select activity, count(*) as activity_count 
from friends 
group by activity)


select activity from friendscte 
where activity_count not in (select max(activity_count) from friendscte) 
and activity_count not in (select min(activity_count) from friendscte);




SELECT activity
FROM (
SELECT activity, COUNT(*) AS 'act_num', MAX(COUNT(*)) OVER() AS 'max_act', 
    MIN(COUNT(*)) OVER() AS 'min_act'
FROM Friends
GROUP BY activity
ORDER BY act_num DESC
) AS TABLE1
WHERE act_num NOT IN (max_act, min_act)
;
