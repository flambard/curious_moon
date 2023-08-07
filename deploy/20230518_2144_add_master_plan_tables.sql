-- Deploy curious_moon:20230518_2144_add_master_plan_tables to pg
BEGIN;
CREATE TABLE event_types(
    id serial PRIMARY KEY,
    description text
);
CREATE TABLE targets(
    id serial PRIMARY KEY,
    description text
);
CREATE TABLE teams(
    id serial PRIMARY KEY,
    description text
);
CREATE TABLE requests(
    id serial PRIMARY KEY,
    description text
);
CREATE TABLE spass_types(
    id serial PRIMARY KEY,
    description text
);
CREATE TABLE events(
    id serial PRIMARY KEY,
    time_stamp timestamptz NOT NULL,
    title varchar(500),
    description text,
    event_type_id int REFERENCES event_types(id),
    spass_type_id int REFERENCES spass_types(id),
    target_id int REFERENCES targets(id),
    team_id int REFERENCES teams(id),
    request_id int REFERENCES requests(id)
);
COMMIT;
