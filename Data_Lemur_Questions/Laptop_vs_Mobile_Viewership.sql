-- Count laptop views and mobile (phone + tablet) views side-by-side
SELECT 

    -- Count all rows where device_type = 'laptop'
    SUM(
        CASE 
            WHEN device_type = 'laptop' THEN 1   -- add 1 for every laptop view
            ELSE 0                               -- add 0 for all others
        END
    ) AS laptop_views,

    -- Count all rows where device_type is phone or tablet
    SUM(
        CASE 
            WHEN device_type IN ('phone', 'tablet') THEN 1  -- add 1 for mobile devices
            ELSE 0                                          -- add 0 for everything else
        END
    ) AS mobile_views

-- All counts are calculated from the same table
FROM viewership;
