-- Analyze tire defect trends over time by production line to identify quality control issues

WITH defect_counts AS (
    -- Calculate monthly defect counts per production line
    SELECT 
        production_line,
        EXTRACT(YEAR FROM defect_date) AS defect_year,
        EXTRACT(MONTH FROM defect_date) AS defect_month,
        COUNT(*) AS monthly_defect_count
    FROM 
        defect_data
    WHERE 
        defect_flag = 1 -- Only include defective tires
    GROUP BY 
        production_line, EXTRACT(YEAR FROM defect_date), EXTRACT(MONTH FROM defect_date)
),
production_counts AS (
    -- Calculate monthly production counts per production line
    SELECT 
        production_line,
        EXTRACT(YEAR FROM production_date) AS production_year,
        EXTRACT(MONTH FROM production_date) AS production_month,
        COUNT(*) AS monthly_production_count
    FROM 
        production_data
    GROUP BY 
        production_line, EXTRACT(YEAR FROM production_date), EXTRACT(MONTH FROM production_date)
)
-- Join the two datasets to calculate defect rates
SELECT 
    p.production_line,
    p.production_year,
    p.production_month,
    p.monthly_production_count,
    COALESCE(d.monthly_defect_count, 0) AS monthly_defect_count, -- Handle months with zero defects
    ROUND(COALESCE(d.monthly_defect_count, 0) * 100.0 / p.monthly_production_count, 2) AS defect_rate_percentage
FROM 
    production_counts p
LEFT JOIN 
    defect_counts d
ON 
    p.production_line = d.production_line
    AND p.production_year = d.defect_year
    AND p.production_month = d.defect_month
ORDER BY 
    p.production_line, p.production_year, p.production_month;

-- Importance: Identifies specific production lines and time periods with high defect rates,
-- enabling targeted improvements in the manufacturing process.
