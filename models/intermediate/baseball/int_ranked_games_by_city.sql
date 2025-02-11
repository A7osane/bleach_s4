WITH ranked_games AS (
    SELECT
        venue_city,
        gameid,
        year,
        attendance,
        away_team_name,
        home_team_name,
        duration,
        ROW_NUMBER() OVER (
            PARTITION BY venue_city
            ORDER BY attendance DESC, duration DESC
        ) AS rank
    FROM
        {{ ref('stg_game_metrics') }}
)
SELECT
    venue_city,
    gameid,
    year,
    attendance,
    away_team_name,
    home_team_name,
    duration,
    rank
FROM
    ranked_games