SELECT
    manufacturer, 
    -- Company name

    CONCAT(
        '$', 
        ROUND(SUM(total_sales) / 1000000), 
        ' million'
    ) AS sales_mil
    -- Total sales per manufacturer, summed, converted to millions,
    -- rounded to the nearest whole number, and formatted for display

FROM pharmacy_sales
-- Source table containing individual sales records

GROUP BY manufacturer
-- Aggregate all rows per manufacturer

ORDER BY 
    ROUND(SUM(total_sales) / 1000000) DESC,
    -- Primary sort: highest total sales (numeric) first

    manufacturer DESC;
    -- Secondary sort: manufacturer name (Z → A) when sales tie
