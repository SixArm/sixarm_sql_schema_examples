--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table person__event (
  person_id int, -- example: Alice
  event_id int   -- example: music concert
);
--rollback drop table person__event;
