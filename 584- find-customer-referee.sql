select name from customer where id not in
(select id from customer where referee_id=2);
