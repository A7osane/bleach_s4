WITH ranked_games AS (
    SELECT
        venueCity,
        gameid,
        year,
        attendance,
        awayTeamName,
        homeTeamName,
        duration,
        ROW_NUMBER() OVER (
            PARTITION BY venueCity
            ORDER BY attendance DESC, duration DESC
        ) AS rank
    FROM
        {{ source('baseball', 'games_post_wide') }}
)
SELECT
    venueCity,
    gameid,
    year,
    attendance,
    awayTeamName,
    homeTeamName,
    duration
FROM
    ranked_games
WHERE
    rank = 1
ORDER BY
    venueCity