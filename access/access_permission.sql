--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_permission'

create table access_permission (
  id int not null primary key,
  name varchar,        -- example: administrator can create item
  access_role_id int,       -- example: administrator
  access_operation_id int   -- example: create item
);

--rollback drop table access_permission;
