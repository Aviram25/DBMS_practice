SELECT 
    app_id,   -- Calculate CTR separately for each app
    
    ROUND(
        100.0 *   -- Multiply by 100.0 to force float division (avoid integer division)
        
        -- Count total clicks
        SUM(CASE 
                WHEN event_type = 'click' THEN 1 
                ELSE 0 
            END)
        /
        -- Count total impressions
        SUM(CASE 
                WHEN event_type = 'impression' THEN 1 
                ELSE 0 
            END)
    , 2) AS ctr    -- Round CTR to 2 decimal places
    
FROM events

-- Only include records from year 2022
WHERE EXTRACT(YEAR FROM timestamp) = 2022

-- Required because we select app_id and aggregate other columns
GROUP BY app_id;
