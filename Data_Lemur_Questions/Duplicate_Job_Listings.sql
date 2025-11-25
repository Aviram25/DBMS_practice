-- Count how many companies appear more than once in the table
SELECT COUNT(*) AS duplicate_companies 
FROM (
    
    -- Find each company_id that appears more than once
    SELECT company_id 
    FROM job_listings 
    GROUP BY company_id                     -- group all rows by company_id
    HAVING COUNT(*) > 1                     -- keep only companies with duplicates

) AS t;                                     -- treat the result as a temporary table
