with logcte as 
(
select 
    log_id, 
    log_id-row_number() over(order by log_id) as rn
from logs
)


select distinct
min(log_id) over (partition by rn) as start_id,
max(log_id) over (partition by rn) as end_id 
from logcte
