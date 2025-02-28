
    SELECT
        *
    FROM
        {{ source('faa', 'us_airports') }}