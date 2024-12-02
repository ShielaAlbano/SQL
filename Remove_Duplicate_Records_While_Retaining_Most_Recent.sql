-- Deduplicate tire data, retaining the most recent record

WITH ranked_duplicates AS (
    SELECT 
        id,
        tire_id,
        ROW_NUMBER() OVER (PARTITION BY tire_id ORDER BY last_updated DESC) AS row_rank
    FROM 
        tire_data
)
-- Delete duplicates retaining only the first-ranked record
DELETE FROM tire_data
WHERE id IN (
    SELECT id FROM ranked_duplicates WHERE row_rank > 1
);

-- Importance: Ensures data integrity by removing duplicates and retaining the most relevant records.
