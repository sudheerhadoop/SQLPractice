/** find all the amount greater that 10000 and join with users to get users **/

select name, a.balance as balance from 
users u join 
(select account, sum(amount) as balance  
from transactions 
group by account 
having sum(amount) > 10000) a  on u.account=a.account;
