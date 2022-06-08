select c.country_name, 
case when avgcountry.avg_weather_state <= 15 then 'Cold'
when avgcountry.avg_weather_state>= 25 then 'Hot'
else 'Warm' end as weather_type
from countries c
join
(
select country_id, sum(weather_state)/count(country_id) as avg_weather_state 
from weather 
where left(day,7) = '2019-11'
group by country_id) avgcountry on c.country_id=avgcountry.country_id;



/**********************Better Solution ************/
SELECT a.country_name,
CASE WHEN AVG(weather_state)<=15 THEN "Cold"
WHEN AVG(weather_state)>=25 THEN "Hot"
ELSE "Warm" END as weather_type FROM Countries as a
JOIN Weather as b
ON a.country_id=b.country_id
WHERE b.day BETWEEN "2019-11-01" AND "2019-11-30"
GROUP BY a.country_id;
