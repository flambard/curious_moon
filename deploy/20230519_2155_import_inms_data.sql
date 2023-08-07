-- Deploy curious_moon:20230519_2155_import_inms_data to pg
BEGIN;
\copy import.inms from 'data/INMS/inms.csv' with delimiter ',' header csv
COMMIT;
