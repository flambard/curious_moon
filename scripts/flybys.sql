drop table if exists flybys;

with lows_by_week as (
  select year, week, min(altitude) as altitude
  from flyby_altitudes
  group by year, week
), nadirs as (
  select low_time(altitude, year, week) as time_stamp, altitude
  from lows_by_week
  order by time_stamp asc
)
-- push to a new table
select nadirs.*,
  null::varchar as name,
  null::timestamp as start_time,
  null::timestamp as end_time
into flybys
from nadirs;

-- add a primary key
alter table flybys
add column id serial primary key;

-- using the key, create the flyby name
update flybys
set name = 'E-' || id - 1;
