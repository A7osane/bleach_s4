SELECT
    venue_city,
    gameid,
    year,
    attendance,
    away_team_name,
    home_team_name,
    duration
FROM
    {{ ref('int_ranked_games_by_city') }}
WHERE
    rank = 1
ORDER BY
    venue_city