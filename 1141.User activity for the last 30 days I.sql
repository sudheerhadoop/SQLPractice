select activity_date as day,count(distinct user_id) as active_users 
from activity 
where  activity_date > cast("2019-06-27" as date) and  activity_date <= cast("2019-07-27" as date)
group by activity_date
order by activity_date;


