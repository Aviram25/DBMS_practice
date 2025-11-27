SELECT e.user_id 
FROM emails e 

-- Join first text record (t1) for the same user
JOIN texts t1 
    ON e.email_id = t1.email_id 

-- Join second text record (t2) for the same user
JOIN texts t2 
    ON e.email_id = t2.email_id

WHERE 
    -- Day 0: User did NOT confirm on signup day
    t1.signup_action = 'Not Confirmed'
    AND DATEDIFF(t1.action_date, e.signup_date) = 0

    -- Day 1: User DID confirm the next day
    AND t2.signup_action = 'Confirmed'
    AND DATEDIFF(t2.action_date, e.signup_date) = 1;
