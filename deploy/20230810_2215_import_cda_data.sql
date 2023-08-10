-- Deploy curious_moon:20230519_2051_import_cda_data to pg
BEGIN;
\copy import.cda from 'data/CDA/cda.csv' with delimiter ',' header csv
COMMIT;
