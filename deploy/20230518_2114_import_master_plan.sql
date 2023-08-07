-- Deploy curious_moon:20230518_2114_import_master_plan to pg
BEGIN;
\copy import.master_plan from 'data/master_plan.csv' with delimiter ',' header csv
COMMIT;
