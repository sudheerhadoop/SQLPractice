select 
username,
activity,
startDate,
endDate
from
(select 
username,
activity,
startDate,
endDate,
row_number() over(partition by username order by endDate desc) as rn,
count(*) over(partition by username) as cnt
from useractivity) inn
where inn.rn = 2 or inn.cnt = 1;
