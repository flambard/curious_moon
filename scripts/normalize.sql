drop table if exists events;

drop table if exists event_types;
create table event_types (
  id serial primary key,
  description text
);
insert into event_types (description)
select distinct(library_definition)
from import.master_plan;


drop table if exists targets;
create table targets (
  id serial primary key,
  description text
);
insert into targets (description)
select distinct(target)
from import.master_plan;


drop table if exists teams;
create table teams (
  id serial primary key,
  description text
);
insert into teams (description)
select distinct(team)
from import.master_plan;


drop table if exists requests;
create table requests (
  id serial primary key,
  description text
);
insert into requests (description)
select distinct(request_name)
from import.master_plan;


drop table if exists spass_types;
create table spass_types (
  id serial primary key,
  description text
);
insert into spass_types (description)
select distinct(spass_type)
from import.master_plan;


create table events (
  id serial primary key,
  time_stamp timestamptz not null,
  title varchar(500),
  description text,
  event_type_id int references event_types(id),
  spass_type_id int references spass_types(id),
  target_id int references targets(id),
  team_id int references teams(id),
  request_id int references requests(id)
);

insert into events (
  time_stamp,
  title,
  description,
  event_type_id,
  target_id,
  team_id,
  request_id,
  spass_type_id
)
select
  import.master_plan.start_time_utc::timestamptz at time zone 'UTC',
  import.master_plan.title,
  import.master_plan.description,
  event_types.id as event_type_id,
  targets.id as target_id,
  teams.id as team_id,
  requests.id as request_id,
  spass_types.id as spass_type_id
from import.master_plan
inner join event_types
  on event_types.description = import.master_plan.library_definition
inner join targets
  on targets.description = import.master_plan.target
inner join teams
  on teams.description = import.master_plan.team
inner join requests
  on requests.description = import.master_plan.request_name
inner join spass_types
  on spass_types.description = import.master_plan.spass_type;
