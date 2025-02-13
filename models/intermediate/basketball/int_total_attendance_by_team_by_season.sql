SELECT 
    season,
    name AS team_name,
    SUM(attendance) AS total_attendance
FROM
    {{ ref('stg_mbb_historical_teams_games') }}
GROUP BY 
    season,
    name