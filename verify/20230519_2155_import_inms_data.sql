-- Verify curious_moon:20230519_2155_import_inms_data on pg
BEGIN;
SELECT
    1 / count(1)
FROM
    import.inms;
ROLLBACK;
