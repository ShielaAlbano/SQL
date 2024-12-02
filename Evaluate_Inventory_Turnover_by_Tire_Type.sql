Evaluate Inventory Turnover by Tire Type

-- Calculate inventory turnover rates by tire type to measure inventory efficiency

SELECT 
    tire_type, 
    SUM(starting_inventory + replenishments - ending_inventory) AS total_inventory_handled, -- Total inventory available
    SUM(units_sold) AS total_units_sold, -- Total units sold
    ROUND(SUM(units_sold) * 1.0 / NULLIF(SUM(starting_inventory + replenishments - ending_inventory), 0), 2) AS inventory_turnover_rate -- Turnover rate
FROM 
    inventory_data
GROUP BY 
    tire_type -- Group by tire type for a detailed analysis
ORDER BY 
    inventory_turnover_rate DESC; -- Sort by turnover rate to highlight efficient tire types

-- Importance: Identifies which tire types are moving quickly and which are underperforming, enabling better stock management.
