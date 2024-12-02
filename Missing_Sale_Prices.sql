Impute Missing Sale Prices-- Fill missing sale prices with the average sale price of the same tire type

UPDATE tire_data
SET sale_price = (
    SELECT AVG(sale_price) 
    FROM tire_data AS sub
    WHERE sub.tire_type = tire_data.tire_type AND sale_price IS NOT NULL
)
WHERE sale_price IS NULL;

-- Importance: Ensures that missing sale prices do not lead to incomplete financial analyses.
