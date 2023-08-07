-- Revert curious_moon:20230518_2032_add_master_plan_import_table from pg
BEGIN;
DROP TABLE import.master_plan;
COMMIT;
