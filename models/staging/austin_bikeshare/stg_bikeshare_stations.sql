    SELECT
        station_id,
        name AS station_name
    FROM
        {{ source('austin_bikeshare', 'bikeshare_stations') }}
