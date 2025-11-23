-- Step 1: Count how many tweets each user posted in 2022
SELECT 
    user_id, 
    COUNT(tweet_id) AS tweet_count_per_user
FROM tweets
WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY user_id

-- Step 2: Group users by their tweet count (bucket users by activity level)

SELECT 
    tweet_count_per_user AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM (
    -- Subquery: total tweets per user in 2022
    SELECT 
        user_id, 
        COUNT(tweet_id) AS tweet_count_per_user
    FROM tweets
    WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY user_id
) AS total_tweets
GROUP BY tweet_count_per_user;
