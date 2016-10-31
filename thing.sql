--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table thing (
  id int not null primary key,
  name_en varchar(255),         -- example: apple
  name_fr varchar(255),         -- example: pomme
);
--rollback drop table thing;
