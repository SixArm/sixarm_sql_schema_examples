--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table brand (
  id int not null primary key,
  name varchar(255) -- example: Acme Brand

);
--rollback drop table brand;