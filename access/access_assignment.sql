--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_assignment'

create table access_assignment (
  id uuid not null primary key,
  person_id uuid references person, -- example: Alice
  access_role_id uuid references access_role, -- example: Administrator
  name_as_en varchar unique, -- example: "administrator can create item"
  name_as_es varchar unique, -- example: administrador puede crear ít"
  name_as_fr varchar unique -- example: "administrateur pouvez créer article"
);

--rollback drop table access_assignment;
