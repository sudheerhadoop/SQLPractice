select email from (
select email, count(*) as count from person
group by email) inn where count>1; 
