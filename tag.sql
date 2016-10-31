--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table tag (
  id int not null primary key,
  name_en varchar(255),         -- example: hot
  name_fr varchar(255),         -- example: chaud
);
--rollback drop table tag;
