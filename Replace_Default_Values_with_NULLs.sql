-- Replace placeholder default values (e.g., 0 or "N/A") with NULL

UPDATE tire_data
SET 
    sale_price = CASE WHEN sale_price = 0 THEN NULL ELSE sale_price END,
    production_date = CASE WHEN production_date = '1900-01-01' THEN NULL ELSE production_date END,
    region = CASE WHEN region = 'N/A' THEN NULL ELSE region END;

-- Importance: Ensures that missing or invalid values are properly marked as NULL for accurate processing.
