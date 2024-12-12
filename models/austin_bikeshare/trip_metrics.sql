SELECT
station_id, 
COUNT(*) AS total_trips
FROM
     {{ ref ("trip_count_by_station") }}
GROUP BY
    station_id     