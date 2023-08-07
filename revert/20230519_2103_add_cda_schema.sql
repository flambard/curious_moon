-- Revert curious_moon:20230519_2103_add_cda_schema from pg
BEGIN;
DROP SCHEMA cda;
COMMIT;
