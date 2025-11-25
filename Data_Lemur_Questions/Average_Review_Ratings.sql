-- Get average star rating per product for each month
SELECT 
    EXTRACT(MONTH FROM submit_date) AS mth,   -- extract month number (1–12)
    product_id AS product,                    -- product being reviewed
    ROUND(AVG(stars), 2) AS avg_stars         -- average rating rounded to 2 decimals
FROM reviews
-- Group rows so each (month, product) pair becomes one result row
GROUP BY 
    EXTRACT(MONTH FROM submit_date), 
    product
-- Sort output by month first, then by product
ORDER BY 
    mth, product;
