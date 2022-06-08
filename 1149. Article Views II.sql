##SELECT DISTINCT v1.viewer_id AS id
##FROM views v1
##JOIN views v2
##ON v1.viewer_id = v2.viewer_id
##AND v1.view_date = v2.view_date
##AND v1.article_id != v2.article_id
##ORDER BY 1;



select distinct viewer_id as id
from 
views 
group by viewer_id, view_date
having count(distinct article_id) > 1
order by 1;
