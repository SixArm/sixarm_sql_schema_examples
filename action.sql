--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'action'

create table action ( --see https://schema.org/Action
  id uuid not null primary key,
  name_as_en varchar, -- example: sing at a music concert
  name_as_es varchar, -- example cantar en un concierto de musica
  name_as_fr varchar, -- example: chanter à concert de musique
  start_when timestamp, -- example: 2000-01-01TZ
  start_date_local date, -- example: : 2000-01-01
  start_time_local time, -- example: 12:00:00
  stop_when timestamp, -- example: 2000-01-02T12:00:00Z
  stop_date_local date, -- example: : 2000-01-01
  stop_time_local time, -- example: 12:00:00
  duration integer, -- example: 86400 seconds a.k.a. 1 day
  agent_person_id uuid references person, -- example: Alice
  agent_place_id uuid references place, -- example: Golden Gate Park
  agent_thing_id uuid references thing, -- example: hammer
  agent_org_id uuid references org, --  example: Acme
);

--rollback drop table action;
