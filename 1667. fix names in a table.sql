select user_id, concat(Upper(left(name,1)), right(lower(name), length(name)-1)) as name from users
order by user_id;
