WITH station_data AS (
    SELECT
    *
    FROM  {{ ref('stg_bikeshare_stations') }}
),
trip_data AS (
    SELECT
        start_station_id,
        COUNT(*) AS total_trips
    FROM
        {{ ref('stg_bikeshare_trips') }}
    GROUP BY
        start_station_id
)
SELECT
    s.station_id,
    s.station_name,
    COALESCE(t.total_trips, 0) AS total_trips
FROM
    station_data s
LEFT JOIN
    trip_data t
ON
    s.station_id = t.start_station_id