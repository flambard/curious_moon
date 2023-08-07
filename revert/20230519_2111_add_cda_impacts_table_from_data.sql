-- Revert curious_moon:20230519_2111_add_cda_impacts_table_from_data from pg
BEGIN;
DROP TABLE cda.impacts;
COMMIT;
