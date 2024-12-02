Correlate Tire Material Types with Defects-- Analyze the correlation between tire material types and defect rates to evaluate material quality

WITH defect_summary AS (
    -- Count defects and total tires by material type
    SELECT 
        material_type,
        COUNT(*) AS total_tires,
        SUM(CASE WHEN defect_flag = 1 THEN 1 ELSE 0 END) AS defect_count
    FROM 
        tire_data
    GROUP BY 
        material_type
)
-- Calculate defect rate for each material type
SELECT 
    material_type,
    total_tires,
    defect_count,
    ROUND(defect_count * 100.0 / total_tires, 2) AS defect_rate_percentage
FROM 
    defect_summary
ORDER BY 
    defect_rate_percentage DESC;

-- Importance: Evaluates material quality by analyzing the defect rate associated with each material type.
-- This helps identify materials that may require further testing or replacement.
