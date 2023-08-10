-- Revert curious_moon:20230519_2051_import_cda_data from pg
BEGIN;
TRUNCATE import.cda RESTART IDENTITY;
COMMIT;
