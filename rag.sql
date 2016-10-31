--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table rag (
  id int not null primary key,
  color_id int, -- example: red
);
--rollback drop table rag;
