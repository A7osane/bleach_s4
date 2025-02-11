SELECT
    venueCity AS venue_city,
    gameid,
    year,
    attendance,
    awayTeamName AS away_team_name,
    homeTeamName AS home_team_name,
    duration
FROM
    {{ source('baseball', 'games_post_wide') }}