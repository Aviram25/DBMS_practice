-- Select manufacturer-level loss information
SELECT 
    manufacturer,

    -- Count how many drugs made by this manufacturer resulted in a loss
    COUNT(drug) AS drug_count,

    -- Calculate total loss by summing (cogs - total_sales) for each loss-making drug
    SUM(cogs - total_sales) AS total_loss

FROM pharmacy_sales

-- Consider only those entries where the manufacturer loses money
-- (i.e., cost of goods sold is greater than the revenue)
WHERE cogs > total_sales

-- Group results by manufacturer to aggregate loss values
GROUP BY manufacturer

-- Order manufacturers from highest loss to lowest loss
ORDER BY total_loss DESC;
