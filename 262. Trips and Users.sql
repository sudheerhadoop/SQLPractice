select t.request_at as Day, round(sum(status!='completed')/count(*),2) as "Cancellation Rate"
from trips t 
where driver_id in (select users_id from users u where u.banned='No') 
and client_id in (select users_id from users u where u.banned='No') 
and request_at between '2013-10-01' and '2013-10-03'
group by t.request_at;






#select t.request_at as Day, round(sum(status!='completed')/count(*),2) as "Cancellation Rate"
#from trips t 
#join users driver 
#on t.driver_id = driver.users_id
#join users client
#on t.client_id = client.users_id
#where driver.banned='No' and client.banned='No' 
#and request_at between '2013-10-01' and '2013-10-03'
#group by t.request_at;
