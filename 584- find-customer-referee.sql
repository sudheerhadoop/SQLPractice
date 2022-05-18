select name from customer where id not in
(select id from customer where referee_id=2);


or 

SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;
