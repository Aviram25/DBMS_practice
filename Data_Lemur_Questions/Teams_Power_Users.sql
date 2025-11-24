-- Select each user who sent messages and count how many they sent
SELECT 
    sender_id, 
    COUNT(*) AS message_count
FROM messages

-- Only include messages sent in August 2022
WHERE sent_date >= '2022-08-01'
  AND sent_date < '2022-09-01'

-- Group by user so we can count messages per sender
GROUP BY sender_id

-- Sort users by the highest number of messages sent
ORDER BY message_count DESC

-- Keep only the top 2 power users
LIMIT 2;
