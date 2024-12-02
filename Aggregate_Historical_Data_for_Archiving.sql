-- Summarize and archive historical data older than 5 years

WITH archive_data AS (
    SELECT 
        tire_type,
        region,
        EXTRACT(YEAR FROM production_date) AS production_year,
        COUNT(*) AS total_units_produced,
        SUM(sale_price) AS total_revenue
    FROM 
        tire_data
    WHERE 
        production_date < CURRENT_DATE - INTERVAL '5 years'
    GROUP BY 
        tire_type, region, EXTRACT(YEAR FROM production_date)
)
-- Insert summarized data into the archive table
INSERT INTO tire_data_archive (tire_type, region, production_year, total_units_produced, total_revenue)
SELECT * FROM archive_data;

-- Delete old records from the main table
DELETE FROM tire_data
WHERE production_date < CURRENT_DATE - INTERVAL '5 years';

-- Importance: Reduces the size of active tables and ensures long-term storage of historical data.
