-- Revert curious_moon:20230807_2246_add_low_time_function from pg
BEGIN;
DROP FUNCTION low_time(numeric, double precision, double precision);
COMMIT;
