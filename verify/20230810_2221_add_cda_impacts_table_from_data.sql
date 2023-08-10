-- Verify curious_moon:20230519_2111_add_cda_impacts_table_from_data on pg
BEGIN;
SELECT
    1 / count(1)
FROM
    cda.impacts;
ROLLBACK;
