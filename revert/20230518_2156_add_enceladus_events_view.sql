-- Revert curious_moon:20230518_2156_add_enceladus_events_view from pg
BEGIN;
DROP MATERIALIZED VIEW enceladus_events;
COMMIT;
