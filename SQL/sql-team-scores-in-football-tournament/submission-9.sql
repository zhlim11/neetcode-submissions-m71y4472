-- Write your query below
WITH points AS(
SELECT m.*,
CASE
    WHEN host_goals > guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    ELSE 0
END AS host_team_points,
CASE
    WHEN host_goals < guest_goals THEN 3
    WHEN host_goals = guest_goals THEN 1
    ELSE 0
END AS guest_team_points
from matches m)

SELECT t.team_id, t.team_name, --p1.host_points, p2.guest_points,
(COALESCE(p1.host_points,0) + COALESCE(p2.guest_points,0)) AS num_points
FROM teams t
LEFT JOIN 
(SELECT host_team, sum(host_team_points) AS host_points FROM points GROUP BY host_team) p1
ON t.team_id = p1.host_team
LEFT JOIN 
(SELECT guest_team, sum(guest_team_points) AS guest_points FROM points GROUP BY guest_team) p2
ON t.team_id = p2.guest_team
ORDER BY num_points DESC, team_id
