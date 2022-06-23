select ROUND(
    IFNULL(
(select count(*) as accepted from 
(
select distinct requester_id, accepter_id from 
Requestaccepted
) AS A) /
(select count(*) as requested from 
(
select distinct sender_id, send_to_id from 
FriendRequest
) AS B),0 ),2) as accept_rate;
