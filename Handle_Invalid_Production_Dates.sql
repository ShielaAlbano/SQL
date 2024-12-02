-- Correct invalid production dates based on historical data ranges

UPDATE tire_data
SET production_date = (
    SELECT MIN(production_date) 
    FROM tire_data 
    WHERE production_date >= '1990-01-01'
)
WHERE production_date < '1990-01-01' OR production_date > CURRENT_DATE;

-- Importance: Ensures production dates fall within a valid range, avoiding inconsistencies in analysis.
