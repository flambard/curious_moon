-- Verify curious_moon:20230518_2114_import_master_plan on pg
BEGIN;
SELECT
    1 / count(1)
FROM
    import.master_plan;
ROLLBACK;
