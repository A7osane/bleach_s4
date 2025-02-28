{{
  config(
    tags = "Density",
    meta = {
    "owner": "@Evgenii"
})
}}



SELECT
    *
FROM
    {{ ref('int_pop_grid') }}
ORDER BY population DESC