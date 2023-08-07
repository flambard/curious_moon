-- Deploy curious_moon:20230807_2239_add_flyby_altitudes_view to pg
BEGIN;
CREATE MATERIALIZED VIEW flyby_altitudes AS
SELECT
    sclk::timestamp AS time_stamp,
    date_part('year', sclk::timestamp) AS year,
    date_part('week', sclk::timestamp) AS week,
    alt_t::numeric(10, 3) AS altitude
FROM
    import.inms
WHERE
    target = 'ENCELADUS'
    AND alt_t IS NOT NULL
ORDER BY
    time_stamp;
COMMIT;
