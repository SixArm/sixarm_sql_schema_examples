--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Action

--changeset sixarm@sixarm.com:1
create table action (
  id int not null primary key,
  name_en varchar(20), -- example: sing at a music concert
  name_fr varchar(20), -- example: chanter à concert de musique
  start,               -- example: 2000-01-01T12:00:00Z
  stop,                -- example: 2000-01-02T12:00:00Z
  agent_person_id int,
  agent_organization_id int, 
);
--rollback drop table action;
