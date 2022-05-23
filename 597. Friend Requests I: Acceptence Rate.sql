select round(if(requests = 0, 0, accepts / requests), 2) as accept_rate
from
(
select count(distinct sender_id, send_to_id) as requests
from friend_request
) as r,
(
select count(distinct requester_id, accepter_id) as accepts
from request_accepted
) as a;
