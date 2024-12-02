Calculate Defect Rates by Tire Type
-- Calculate defect rates by tire type to identify quality issues

SELECT 
    tire_type, 
    COUNT(*) AS total_produced, -- Total number of tires produced
    SUM(CASE WHEN defect_flag = 1 THEN 1 ELSE 0 END) AS total_defects, -- Total number of defective tires
    ROUND(SUM(CASE WHEN defect_flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS defect_rate_percentage -- Defect rate as a percentage
FROM 
    tire_production
GROUP BY 
    tire_type -- Group by tire type to analyze each category separately
ORDER BY 
    defect_rate_percentage DESC; -- Sort by defect rate to prioritize high-defect types

-- Importance: Identifies which tire types have the highest defect rates, aiding in quality control efforts.
