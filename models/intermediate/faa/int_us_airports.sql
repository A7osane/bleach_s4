SELECT
    airports.name,
    airports.faa_identifier,
    airports.service_city,
    airports.airport_type,
    airports.country,
    countries.Continent AS continent,
    airports.object_id,
    CASE
        WHEN airports.airport_type = 'Aerodome' THEN 'a location from which aircraft flight operations take place, regardless of whether they involve air cargo, passengers, or neither, and regardless of whether it is for public or private use'
        WHEN airports.airport_type = 'Heliport' THEN ' airport designed for helicopters only'
        WHEN airports.airport_type = 'Seaport' THEN  ' seaport useed for ships and boats'
        WHEN airports.airport_type = 'Glideport' THEN 'used for gliders'
        WHEN airports.airport_type = 'Ultralightport' THEN 'used for small planes '
        ELSE 'Others'
        END AS airport_description
FROM 
        {{ ref('stg_us_airports') }} AS airports
LEFT JOIN
        {{ ref('countries_by_continent') }} AS countries
ON 
        airports.country = countries.Country
