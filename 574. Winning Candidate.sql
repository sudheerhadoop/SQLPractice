with max_votes as (
select candidateid, 
count(*) as cnt from vote 
group by candidateid
order by cnt desc 
limit 1)


select Name from candidate 
where id=(select candidateid from max_votes);
