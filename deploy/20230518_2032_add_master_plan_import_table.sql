-- Deploy curious_moon:20230518_2032_add_master_plan_import_table to pg
BEGIN;
CREATE TABLE import.master_plan(
    start_time_utc text,
    duration text,
    date text,
    team text,
    spass_type text,
    target text,
    request_name text,
    library_definition text,
    title text,
    description text
);
COMMIT;
