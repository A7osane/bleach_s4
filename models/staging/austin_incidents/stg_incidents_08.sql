    SELECT
        *
    FROM
        {{ source('austin_incidents', 'incidents_2008') }}