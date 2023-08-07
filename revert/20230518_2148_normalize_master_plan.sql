-- Revert curious_moon:20230518_2148_normalize_master_plan from pg
BEGIN;
TRUNCATE
    events,
    spass_types,
    requests,
    teams,
    targets,
    event_types
RESTART IDENTITY;
COMMIT;
