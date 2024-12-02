-- Normalize region names for consistency

UPDATE tire_data
SET region = CASE 
    WHEN LOWER(region) LIKE '%north%' THEN 'North'
    WHEN LOWER(region) LIKE '%south%' THEN 'South'
    WHEN LOWER(region) LIKE '%east%' THEN 'East'
    WHEN LOWER(region) LIKE '%west%' THEN 'West'
    ELSE 'Unknown' -- Handle unrecognized regions
END;

-- Importance: Ensures consistent region names for accurate grouping and analysis.
