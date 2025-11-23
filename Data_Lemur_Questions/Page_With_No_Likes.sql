-- Select all page IDs from the pages table (alias: p)
SELECT p.page_id
FROM pages p
-- Keep only those pages for which NO matching page_id exists in page_likes
WHERE NOT EXISTS (
    -- Subquery checks if this page_id appears in page_likes (alias: pl)
    SELECT 1
    FROM page_likes pl
    WHERE p.page_id = pl.page_id   -- Match likes belonging to the page
)
-- Sort the final list of pages with zero likes
ORDER BY p.page_id;
