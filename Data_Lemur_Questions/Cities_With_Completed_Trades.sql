-- Get the top 3 cities with the highest number of completed orders
SELECT 
    b.city,
    COUNT(*) AS total_orders
FROM trades AS a
JOIN users AS b
    ON a.user_id = b.user_id              -- match each trade to its user
WHERE a.status = 'Completed'              -- only count completed orders
GROUP BY b.city                            -- group orders by city
ORDER BY total_orders DESC                 -- highest first
LIMIT 3;                                   -- top 3 cities
