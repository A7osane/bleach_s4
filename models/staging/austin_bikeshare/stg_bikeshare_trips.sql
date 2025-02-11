    SELECT
        start_station_id
    FROM
        {{ source('austin_bikeshare', 'bikeshare_trips') }}