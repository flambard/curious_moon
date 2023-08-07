-- Revert curious_moon:20230518_2144_add_master_plan_tables from pg
BEGIN;
DROP TABLE events;
DROP TABLE event_types;
DROP TABLE targets;
DROP TABLE teams;
DROP TABLE requests;
DROP TABLE spass_types;
COMMIT;
