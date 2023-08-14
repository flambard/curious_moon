-- Verify curious_moon:20230807_2256_add_flybys_table on pg
BEGIN;
DO $$
BEGIN
    ASSERT(
        SELECT
            23 = count(1)
        FROM flybys);
END
$$;
ROLLBACK;
