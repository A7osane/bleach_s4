{% test contains_abc(model, column_name) %}

WITH filtered_cte AS (

SELECT
    {{ column_name }} as has_abc
    
FROM {{ model }}

)

SELECT *
FROM filtered_cte
WHERE REGEXP_CONTAINS(has_abc, '[abc]')

{% endtest %}
