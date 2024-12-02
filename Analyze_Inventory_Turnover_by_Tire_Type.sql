-- Evaluate inventory turnover rates to measure stock efficiency for each tire type

WITH turnover_data AS (
    -- Calculate total inventory handled and units sold for each tire type
    SELECT 
        tire_type,
        SUM(starting_inventory + replenishments - ending_inventory) AS total_inventory_handled,
        SUM(units_sold) AS total_units_sold
    FROM 
        inventory_data
    GROUP BY 
        tire_type
)
-- Calculate turnover rates for each tire type
SELECT 
    tire_type,
    total_inventory_handled,
    total_units_sold,
    ROUND(total_units_sold * 1.0 / NULLIF(total_inventory_handled, 0), 2) AS turnover_rate
FROM 
    turnover_data
ORDER BY 
    turnover_rate DESC;

-- Importance: Identifies tire types with the highest and lowest turnover rates,
-- enabling better stock management and reducing holding costs.
