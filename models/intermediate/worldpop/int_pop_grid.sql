SELECT 
    country_name, 
    alpha_3_code, 
    population,
    last_updated,
CASE    
    WHEN population >= 20000 THEN 'Extremely Dense'
    WHEN population >= 10000  THEN 'Very Dense'
    WHEN population >= 1000 THEN 'Dense'
    WHEN population >= 100 THEN 'Moderately Dense'
    ELSE 'Low Density'
END AS population_density_category

FROM
    {{ ref('stg_pop_grid') }}
LIMIT 1000