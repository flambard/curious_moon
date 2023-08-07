-- Verify curious_moon:20230519_2051_import_cda_data on pg
BEGIN;
SELECT
    1 / count(1)
FROM
    import.cda;
ROLLBACK;
