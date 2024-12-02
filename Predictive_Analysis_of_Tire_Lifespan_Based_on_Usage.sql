-- Analyze tire lifespan to predict when replacements may be needed based on usage patterns

WITH lifespan_data AS (
    -- Calculate tire lifespan in months and categorize usage
    SELECT 
        tire_id,
        DATEDIFF(MONTH, production_date, failure_date) AS lifespan_months,
        CASE 
            WHEN mileage <= 20000 THEN 'Low Usage'
            WHEN mileage BETWEEN 20001 AND 40000 THEN 'Medium Usage'
            ELSE 'High Usage'
        END AS usage_category
    FROM 
        tire_usage_data
    WHERE 
        failure_date IS NOT NULL -- Only include tires with a recorded failure date
)
-- Aggregate lifespan data by usage category
SELECT 
    usage_category,
    COUNT(*) AS tire_count,
    AVG(lifespan_months) AS avg_lifespan_months,
    MIN(lifespan_months) AS min_lifespan_months,
    MAX(lifespan_months) AS max_lifespan_months
FROM 
    lifespan_data
GROUP BY 
    usage_category
ORDER BY 
    avg_lifespan_months DESC;

-- Importance: Helps predict when tires are likely to fail based on usage patterns,
-- supporting proactive maintenance and customer recommendations.
