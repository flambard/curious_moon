-- Revert curious_moon:20230519_2143_add_inms_import_table from pg
BEGIN;
DROP TABLE import.inms;
COMMIT;
