-- Revert curious_moon:20230515_2207_import_schema from pg
BEGIN;
DROP SCHEMA import;
COMMIT;
