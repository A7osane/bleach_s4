with partitioned AS(
SELECT 
    season,
    team_name,
    total_points,
    ROW_NUMBER() OVER(PARTITION BY season ORDER BY total_points DESC) AS top_ranking
FROM 
    {{ ref('int_total_points_by_team_by_season') }}
)

SELECT 
    *
FROM
    partitioned
WHERE
    top_ranking <= 10
ORDER BY
    top_ranking ASC