-- Deploy curious_moon:20230807_2246_add_low_time_function to pg
BEGIN;
CREATE FUNCTION low_time(alt numeric, yr double precision, wk double precision, out
    timestamp without time zone)
AS $$
    SELECT
        min(time_stamp) +(max(time_stamp) - min(time_stamp)) / 2 AS nadir
    FROM
        flyby_altitudes
    WHERE
        flyby_altitudes.altitude = alt
        AND flyby_altitudes.year = yr
        AND flyby_altitudes.week = wk
$$
LANGUAGE sql;
COMMIT;
