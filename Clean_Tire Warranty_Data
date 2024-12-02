Clean Tire Warranty Data-- Standardize warranty claim data and remove invalid entries

WITH valid_claims AS (
    SELECT 
        id,
        tire_id,
        claim_date,
        claim_amount,
        CASE 
            WHEN claim_amount < 0 THEN NULL -- Remove negative claims
            WHEN claim_date > CURRENT_DATE THEN NULL -- Remove future claims
            ELSE claim_amount
        END AS valid_claim_amount
    FROM 
        warranty_claims
)
-- Update warranty claims with cleaned data
UPDATE warranty_claims
SET claim_amount = valid_claims.valid_claim_amount
FROM valid_claims
WHERE warranty_claims.id = valid_claims.id;

-- Importance: Ensures warranty claim data is accurate and free from unrealistic or invalid entries.
