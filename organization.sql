--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Organization

--changeset sixarm@sixarm.com:1
create table organization (
  id int not null primary key,
  name varchar(255) -- example: Acme
);
--rollback drop table organization;
