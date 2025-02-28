SELECT 
    *
FROM 
    {{ ref('top_10_total_points_by_team_by_season') }}
WHERE total_points > 1000