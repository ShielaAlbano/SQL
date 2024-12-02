Analyze Sales Trends by Month
-- Analyze monthly sales trends to identify seasonality in tire sales

SELECT 
    DATE_PART('month', sale_date) AS sale_month, -- Extract the month from the sale date
    COUNT(*) AS total_sales, -- Total number of sales transactions
    SUM(quantity_sold) AS total_units_sold, -- Total number of tires sold
    SUM(quantity_sold * sale_price) AS total_revenue -- Total revenue generated
FROM 
    tire_sales
GROUP BY 
    DATE_PART('month', sale_date) -- Group by the extracted month
ORDER BY 
    sale_month; -- Order results chronologically by month

-- Importance: Helps identify peak sales months, allowing the company to optimize inventory and marketing strategies.
