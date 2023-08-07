-- Deploy curious_moon:20230518_2156_add_enceladus_events_view to pg
BEGIN;
CREATE MATERIALIZED VIEW enceladus_events AS
SELECT
    events.id,
    events.title,
    events.description,
    events.time_stamp,
    events.time_stamp::date AS date,
    event_types.description AS event,
    to_tsvector(concat(events.description, events.title)) AS search
FROM
    events
    INNER JOIN event_types ON event_types.id = events.event_type_id
WHERE
    target_id = 28
ORDER BY
    time_stamp ASC;
---
CREATE INDEX idx_event_search ON enceladus_events USING GIN(search);
COMMIT;
