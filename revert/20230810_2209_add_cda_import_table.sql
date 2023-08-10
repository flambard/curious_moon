-- Revert curious_moon:20230810_2209_add_cda_import_table from pg
BEGIN;
DROP TABLE import.cda;
COMMIT;
