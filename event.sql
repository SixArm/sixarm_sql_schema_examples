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
  start_when timestamp, -- example: 2000-01-01T12:00:00Z
  stop_when timestamp, -- example: 2000-01-02T12:00:00Z
);

--rollback drop table event;
