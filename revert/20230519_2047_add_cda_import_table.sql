-- Revert curious_moon:20230519_2047_add_cda_import_table from pg
BEGIN;
DROP TABLE import.cda;
COMMIT;
