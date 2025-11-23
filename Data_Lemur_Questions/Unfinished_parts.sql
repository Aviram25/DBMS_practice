-- Select the part name and its current assembly step
SELECT part, assembly_step
FROM parts_assembly
-- Only return rows where the part has NOT finished assembly
-- finish_date IS NULL means the part is still in progress
WHERE finish_date IS NULL;
