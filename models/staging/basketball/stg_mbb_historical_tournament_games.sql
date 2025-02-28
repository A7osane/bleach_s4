SELECT 
    season,
    round,
    days_from_epoch,
    game_date,
    day,
    win_seed,
    win_region,
    win_market,
    win_name,
    win_alias,
    win_team_id,
    win_school_ncaa,
    win_code_ncaa,
    win_kaggle_team_id,
    win_pts,
    lose_seed,
    lose_region,
    lose_market,
    lose_name,
    lose_alias,
    lose_team_id,
    lose_school_ncaa,
    lose_code_ncaa,
    lose_kaggle_team_id,
    lose_pts,
    num_ot,
    academic_year
FROM
    {{ source('basketball', 'mbb_historical_tournament_games') }}
WHERE season >= {{ var("start_season") }}
AND win_region in {{ var("winning_region") }}
AND win_name in {{ var("winning_name") }}