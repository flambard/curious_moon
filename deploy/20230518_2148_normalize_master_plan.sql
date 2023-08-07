-- Deploy curious_moon:20230518_2148_normalize_master_plan to pg
BEGIN;
---
INSERT INTO event_types(description)
SELECT DISTINCT
    (library_definition)
FROM
    import.master_plan;
---
INSERT INTO targets(description)
SELECT DISTINCT
    (target)
FROM
    import.master_plan;
---
INSERT INTO teams(description)
SELECT DISTINCT
    (team)
FROM
    import.master_plan;
---
INSERT INTO requests(description)
SELECT DISTINCT
    (request_name)
FROM
    import.master_plan;
---
INSERT INTO spass_types(description)
SELECT DISTINCT
    (spass_type)
FROM
    import.master_plan;
---
INSERT INTO events(time_stamp, title, description, event_type_id, target_id, team_id,
    request_id, spass_type_id)
SELECT
    import.master_plan.start_time_utc::timestamptz at time zone 'UTC',
    import.master_plan.title,
    import.master_plan.description,
    event_types.id AS event_type_id,
    targets.id AS target_id,
    teams.id AS team_id,
    requests.id AS request_id,
    spass_types.id AS spass_type_id
FROM
    import.master_plan
    LEFT JOIN event_types ON event_types.description = import.master_plan.library_definition
    LEFT JOIN targets ON targets.description = import.master_plan.target
    LEFT JOIN teams ON teams.description = import.master_plan.team
    LEFT JOIN requests ON requests.description = import.master_plan.request_name
    LEFT JOIN spass_types ON spass_types.description = import.master_plan.spass_type;
COMMIT;
