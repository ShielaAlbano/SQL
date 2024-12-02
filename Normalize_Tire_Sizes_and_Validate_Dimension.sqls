-- Clean and normalize tire sizes and validate dimensions

WITH cleaned_data AS (
    SELECT 
        id,
        -- Standardize tire size by removing non-alphanumeric characters and converting to uppercase
        UPPER(REGEXP_REPLACE(TRIM(tire_size), '[^A-Z0-9/]', '')) AS normalized_tire_size,
        -- Validate diameter range (10 to 30 inches)
        CASE WHEN diameter BETWEEN 10 AND 30 THEN diameter ELSE NULL END AS valid_diameter,
        -- Validate width range (100 to 500 mm)
        CASE WHEN width BETWEEN 100 AND 500 THEN width ELSE NULL END AS valid_width,
        -- Validate aspect ratio range (10% to 100%)
        CASE WHEN aspect_ratio BETWEEN 10 AND 100 THEN aspect_ratio ELSE NULL END AS valid_aspect_ratio
    FROM 
        tire_data
)
-- Update the main table with the cleaned and validated data
UPDATE tire_data
SET 
    tire_size = cleaned_data.normalized_tire_size,
    diameter = cleaned_data.valid_diameter,
    width = cleaned_data.valid_width,
    aspect_ratio = cleaned_data.valid_aspect_ratio
FROM 
    cleaned_data
WHERE 
    tire_data.id = cleaned_data.id;

-- Importance: Standardizes tire sizes for consistency and ensures valid dimensions for accurate analysis.
