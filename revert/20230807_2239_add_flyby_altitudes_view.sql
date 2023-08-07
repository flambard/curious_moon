-- Revert curious_moon:20230807_2239_add_flyby_altitudes_view from pg
BEGIN;
DROP MATERIALIZED VIEW flyby_altitudes;
COMMIT;
