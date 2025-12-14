WITH trans_nums AS (
    SELECT 
        user_id,
        spend,
        transaction_date,

        -- Assign a sequential number to each transaction per user
        -- ordered by transaction date (earliest first)
        ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date
        ) AS row_num

    FROM transactions
    -- Base table containing all transactions
)

SELECT
    user_id,
    spend,
    transaction_date
    -- Details of the 3rd transaction for each user

FROM trans_nums
WHERE row_num = 3;
-- Filters to only the third transaction per user
