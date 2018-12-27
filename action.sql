--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'action'

create table action ( --see https://schema.org/Action
  id uuid not null primary key,
  name_as_en varchar, -- example: "sing at a music concert"
  name_as_as varchar, -- example "cantar en un concierto de musica"
  name_as_fr varchar, -- example: "chanter à concert de musique"
  start,              -- example: 2000-01-01T12:00:00Z
  stop,               -- example: 2000-01-02T12:00:00Z
  agent_person_id uuid,
  agent_organization_id uuid, 
);

--rollback drop table action;
