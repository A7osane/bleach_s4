{{ config(
    tags=["top trips"]
) }}


SELECT
    station_id,
    station_name,
    total_trips
FROM
    {{ ref('int_bikeshare_trips_summary') }}
ORDER BY
    total_trips DESC