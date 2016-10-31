--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table place (
  id int not null primary key,
  name varchar(255) -- example: Golden Gate Park

);
--rollback drop table place;
