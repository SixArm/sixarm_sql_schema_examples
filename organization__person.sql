--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table organization__person (
  organization_id int, -- example: Acme
  person_id int        -- example: Alice

);
--rollback drop table organization__person;
