-- Revert curious_moon:20230807_2256_add_flybys_table from pg
BEGIN;
DROP TABLE flybys;
COMMIT;
