-- Select the card name and the difference between its highest and lowest issued amounts
SELECT 
    card_name, 
    MAX(issued_amount) - MIN(issued_amount) AS difference   -- Calculates the range of issued amounts

FROM monthly_cards_issued

-- Filter only the two cards we are interested in
WHERE 
    card_name LIKE 'Chase Freedom Flex' 
    OR card_name LIKE 'Chase Sapphire Reserve'

-- Group results by card so MAX/MIN calculations apply separately to each
GROUP BY card_name

-- Sort the results by the difference in descending order
ORDER BY difference DESC;
