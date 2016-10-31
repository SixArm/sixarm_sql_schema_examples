--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table place__event (
  place_id int, -- example: Golden Gate Park
  event_id int  -- example: music concert
);
--rollback drop table place__event;
