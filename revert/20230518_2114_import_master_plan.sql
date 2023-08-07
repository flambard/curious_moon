-- Revert curious_moon:20230518_2114_import_master_plan from pg
BEGIN;
TRUNCATE import.master_plan RESTART IDENTITY;
COMMIT;
