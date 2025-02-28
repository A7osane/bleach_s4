WITH cte1 AS (
    SELECT
        unique_key,
        descript,
        CAST(timestamp AS DATE) AS incident_date, 
        EXTRACT(MONTH FROM timestamp) AS incident_month,
        time,
        address,
        longitude,
        latitude,
        location
    FROM {{ ref('stg_incidents_08') }}
),

cte2 AS (
    SELECT
        unique_key,
        descript,
        CAST(timestamp AS DATE) AS incident_date, 
        EXTRACT(MONTH FROM timestamp) AS incident_month,
        time,
        address,
        longitude,
        latitude,
        location
    FROM {{ ref('stg_incidents_09') }}

),

agg_cte1 AS (
    SELECT
        descript AS incident_type,
        incident_month,
        COUNT(DISTINCT unique_key) AS incident_count
    FROM 
        cte1
    GROUP BY
        descript, incident_month
    HAVING
        incident_count >= 1
),

agg_cte2 AS (
    SELECT
        descript AS incident_type,
        incident_month,
        COUNT(DISTINCT unique_key) AS incident_count
    FROM 
        cte2
    GROUP BY
        descript, incident_month
    HAVING
        incident_count >= 1
),

joined_ctes AS (
    SELECT  
        COALESCE(agg_cte1.incident_type, agg_cte2.incident_type) AS incident_type, 
        COALESCE(agg_cte1.incident_month, agg_cte2.incident_month) AS incident_month,
        COALESCE(agg_cte1.incident_count, 0) AS incident_count_2008, 
        COALESCE(agg_cte2.incident_count, 0) AS incident_count_2009,
        COALESCE(agg_cte1.incident_count, 0) + COALESCE(agg_cte2.incident_count, 0) AS total_count_08_09
    FROM
        agg_cte1
    FULL JOIN agg_cte2
        ON agg_cte1.incident_type = agg_cte2.incident_type 
        AND agg_cte1.incident_month = agg_cte2.incident_month
)

SELECT
    *
FROM
    joined_ctes 
ORDER BY 
    incident_type, incident_month

