SELECT
    *
FROM
    {{ ref('int_us_airports') }}
ORDER BY country