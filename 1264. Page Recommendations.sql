with friendscte as 
(
select user2_id as userone_friends from 
friendship where user1_id = 1
UNION 
select user1_id as userone_friends from 
friendship where user2_id = 1
)


select distinct l.page_id as recommended_page
from 
friendscte f
join 
Likes l 
on f.userone_friends = l.user_id
and l.page_id not in (select page_id from likes where user_id = 1)
