--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_assignment'

create table access_assignment (
  id int not null primary key,
  name varchar,       -- example: Alice is an Administrator
  person_id int,           -- example: Alice
  access_role_id int       -- example: Administrator
);

--rollback drop table access_assignment;
