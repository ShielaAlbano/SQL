-- Evaluate sales performance for each tire type in different regions to understand market trends

WITH regional_sales AS (
    -- Aggregate sales data by region and tire type
    SELECT 
        region,
        tire_type,
        SUM(quantity_sold) AS total_units_sold,
        SUM(quantity_sold * sale_price) AS total_revenue
    FROM 
        sales_data
    GROUP BY 
        region, tire_type
),
average_price AS (
    -- Calculate the average sale price for each tire type
    SELECT 
        tire_type,
        AVG(sale_price) AS avg_sale_price
    FROM 
        sales_data
    GROUP BY 
        tire_type
)
-- Combine regional sales data with average sale price
SELECT 
    r.region,
    r.tire_type,
    r.total_units_sold,
    r.total_revenue,
    a.avg_sale_price
FROM 
    regional_sales r
JOIN 
    average_price a
ON 
    r.tire_type = a.tire_type
ORDER BY 
    r.region, r.total_revenue DESC;

-- Importance: Provides insights into how different tire types perform in various regions,
-- guiding inventory allocation, pricing strategies, and targeted marketing.
