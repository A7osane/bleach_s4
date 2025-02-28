SELECT
    *
FROM
    {{ source('worldpop', 'population_grid_1km') }}