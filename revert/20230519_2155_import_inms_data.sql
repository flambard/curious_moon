-- Revert curious_moon:20230519_2155_import_inms_data from pg
BEGIN;
TRUNCATE import.inms RESTART IDENTITY;
COMMIT;
