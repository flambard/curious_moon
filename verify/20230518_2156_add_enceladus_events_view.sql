-- Verify curious_moon:20230518_2156_add_enceladus_events_view on pg
BEGIN;
DO $$
BEGIN
    ASSERT(
        SELECT
            1241 = count(1)
        FROM enceladus_events);
END
$$;
ROLLBACK;
