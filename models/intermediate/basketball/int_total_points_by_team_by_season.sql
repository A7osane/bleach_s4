WITH win_matches AS(
SELECT 
    season,
    win_name AS team_name,
    win_pts AS points
FROM
    {{ ref('stg_mbb_historical_tournament_games') }}
),

lose_matches AS(
SELECT 
    season,
    lose_name AS team_name,
    lose_pts AS points
FROM
    {{ ref('stg_mbb_historical_tournament_games') }}
),

all_matches AS(
SELECT 
    *
FROM 
    win_matches
UNION ALL 
SELECT 
    * 
FROM 
    lose_matches
)

SELECT 
    season,
    team_name,
    SUM(points) AS total_points
FROM 
    all_matches
GROUP BY 
    season, 
    team_name