SELECT 
    season,
    scheduled_date,
    attendance,
    market,
    name,
    team_code,
    team_id,
    alias,
    current_division,
    points_game,
    win,
    opp_market,
    opp_name,
    opp_code,
    opp_id,
    opp_alias,
    opp_current_division,
    opp_points_game
FROM
    {{ source('basketball', 'mbb_historical_teams_games') }}
WHERE season >= 2000