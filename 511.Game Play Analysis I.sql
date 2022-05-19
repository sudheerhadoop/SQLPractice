select player_id, min(event_date) as first_login 
from activity 
group by player_id;


----------------
select 
player_id,
first_login
from (
    select 
    player_id, 
    event_date first_login,
    dense_rank() over(
        partition by player_id
        order by event_date
    ) poz
    from Activity
) src
where
poz = 1;
