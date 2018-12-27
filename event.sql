--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'event'

create table event ( --see https://schema.org/Event
  id uuid not null primary key,
  name_as_en varchar, -- example: music concert
  name_as_es varchar, -- example: concierto de musica
  name_as_fr varchar, -- example: concert de musique
  description_as_en varchar, -- example: music concert
  description_as_es varchar, -- example: concierto de musica
  description_as_fr varchar, -- example: concert de musique
  start_when timestamp, -- example: 2000-01-01TZ
  start_date_local date, -- example: : 2000-01-01
  start_time_local time, -- example: 12:00:00
  stop_when timestamp, -- example: 2000-01-02T12:00:00Z
  stop_date_local date, -- example: : 2000-01-01
  stop_time_local time, -- example: 12:00:00
  duration integer -- example: 86400 seconds a.k.a. 1 day
);

--rollback drop table event;
