-- Deploy curious_moon:20230810_2209_add_cda_import_table to pg
BEGIN;
CREATE TABLE import.cda(
    event_id text,
    impact_event_time text,
    impact_event_julian_date text,
    qp_amplitude text,
    qi_amplitude text,
    qt_amplitude text,
    qc_amplitude text,
    spacecraft_sun_distance text,
    spacecraft_saturn_distance text,
    spacecraft_x_velocity text,
    spacecraft_y_velocity text,
    spacecraft_z_velocity text,
    counter_number text,
    particle_mass text,
    particle_charge text
);
COMMIT;
