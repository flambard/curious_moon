-- Deploy curious_moon:20230807_2256_add_flybys_table to pg
BEGIN;
WITH lows_by_week AS (
    SELECT
        year,
        week,
        min(altitude) AS altitude
    FROM
        flyby_altitudes
    GROUP BY
        year,
        week
),
nadirs AS (
    SELECT
        low_time(altitude, year, week) AS time_stamp,
        altitude
    FROM
        lows_by_week
    ORDER BY
        time_stamp ASC)
    -- push to a new table
    SELECT
        nadirs.*,
        NULL::varchar AS name,
        NULL::timestamp AS start_time,
        NULL::timestamp AS end_time INTO flybys
    FROM
        nadirs;
-- add a primary key
ALTER TABLE flybys
    ADD COLUMN id serial PRIMARY KEY;
-- using the key, create the flyby name
UPDATE
    flybys
SET
    name = 'E-' || id - 1;
COMMIT;
