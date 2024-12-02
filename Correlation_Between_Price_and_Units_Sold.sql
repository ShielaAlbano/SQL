Correlation Between Price and Units Sold
-- Analyze the correlation between sale price and units sold to assess price sensitivity

SELECT 
    tire_type, 
    CORR(sale_price, quantity_sold) AS price_units_correlation -- Calculate the correlation between price and units sold
FROM 
    tire_sales
GROUP BY 
    tire_type -- Group by tire type to measure correlation for each category

-- Importance: Determines how price changes impact sales volumes, aiding in pricing strategy optimization.
