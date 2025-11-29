-- Calculate the weighted mean number of items per order
-- using the items_per_order table

SELECT 
    ROUND(
        -- Numerator: total weighted items
        -- Multiply each item_count by how many orders had that count
        SUM(item_count::DECIMAL * order_occurrences)
        /
        -- Denominator: total number of orders
        SUM(order_occurrences)
    , 1) AS mean   -- Round final result to 1 decimal place
FROM items_per_order;
