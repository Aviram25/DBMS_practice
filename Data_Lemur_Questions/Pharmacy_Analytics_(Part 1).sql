-- Select the drug name and calculate its total profit
SELECT 
    drug,
    
    -- Compute profit by subtracting cost of goods sold (cogs)
    -- from the total sales revenue of each drug
    (total_sales - cogs) AS total_profit

FROM pharmacy_sales

-- Sort results so the highest profit appears first
ORDER BY total_profit DESC

-- Return only the top 3 most profitable drugs
LIMIT 3;
