--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'event'

create table event ( --see https://schema.org/Event
  id int not null primary key,
  name_en varchar(20), -- example: music concert
  name_fr varchar(20), -- example: concert de musique
  start,               -- example: 2000-01-01T12:00:00Z
  stop,                -- example: 2000-01-02T12:00:00Z
);

--rollback drop table event;
