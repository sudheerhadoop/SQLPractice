SELECT DISTINCT player_id, device_id
FROM Activity
WHERE (player_id, event_date) in (
    SELECT player_id, min(event_date)
    FROM Activity
    GROUP BY player_id)

#Solution- 2:
SELECT a.player_id, b.device_id
FROM
(SELECT player_id, MIN(event_date) AS event_date FROM Activity
GROUP BY player_id) a
JOIN Activity b
ON a.player_id = b.player_id AND a.event_date = b.event_date;

#Solution- 3:
SELECT player_id, device_id
FROM
(SELECT player_id, device_id, event_date,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS r
FROM Activity) lookup
WHERE r = 1;


/********* my Solution *********/
with player_activity as 
(select player_id, 
       device_id,
       rank() over(partition by player_id order by event_date) rn
from activity)

select player_id, device_id 
from player_activity 
where rn = 1;
