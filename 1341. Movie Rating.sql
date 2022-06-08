select name as results from 
(select u.name as name, count(rating) as rating_count 
from movierating mr join 
users u on mr.user_id=u.user_id
group by u.name
order by rating_count desc, u.name
limit 1) first_query 
UNION 
select name as results from
(select m.title as name, avg(mr.rating) as rating_count 
from movierating mr join 
movies m on mr.movie_id=m.movie_id
where left(created_at,7)='2020-02'
group by m.title
order by rating_count desc, m.title
limit 1) second_query;
