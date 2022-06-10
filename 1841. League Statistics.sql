select t.team_name,
count(*) as matches_played,
sum(case when home_team_goals > away_team_goals then 3 when home_team_goals = away_team_goals then 1 else 0 end) points,
sum(home_team_goals) as goal_for,
sum(away_team_goals) as goal_against,
sum(home_team_goals)-sum(away_team_goals) as goal_diff
from
(select home_team_id as home_team_id, home_team_goals as home_team_goals, away_team_goals as away_team_goals from matches
union all
select away_team_id as home_team_id, away_team_goals as home_team_goals, home_team_goals as away_team_goals from matches) g
join teams t on g.home_team_id=t.team_id
group by t.team_name
order by points desc, goal_diff desc, team_name;
