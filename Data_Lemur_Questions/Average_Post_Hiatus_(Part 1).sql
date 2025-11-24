-- Select each user who posted in 2021
SELECT 
    user_id,

    -- Difference in days between last and first post of the year
    DATEDIFF(MAX(post_date), MIN(post_date)) AS days_between

FROM posts

-- Only consider posts made in the year 2021
WHERE YEAR(post_date) = 2021

-- Group everything by user so we can compute MIN/MAX per user
GROUP BY user_id

-- Keep only users who posted at least twice in 2021
HAVING COUNT(*) >= 2

-- Sort output by user_id for readability
ORDER BY user_id;
