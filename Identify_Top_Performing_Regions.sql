Identify Top-Performing Regions

-- Identify regions generating the highest revenue and sales volume

SELECT 
    region, 
    COUNT(*) AS total_transactions, -- Total number of transactions in the region
    SUM(quantity_sold) AS total_units_sold, -- Total number of tires sold in the region
    SUM(quantity_sold * sale_price) AS total_revenue, -- Total revenue generated
    ROUND(AVG(sale_price), 2) AS avg_sale_price -- Average sale price of tires in the region
FROM 
    tire_sales
GROUP BY 
    region -- Group by region for a detailed regional analysis
ORDER BY 
    total_revenue DESC; -- Sort by revenue to highlight top-performing regions

-- Importance: Provides insights into regional performance, helping target marketing efforts and allocate inventory effectively.
