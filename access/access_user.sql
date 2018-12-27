--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_user'

create table access_user (
  id uuid not null primary key,
  name_as_en varchar, -- example: "Alice"
  name_as_es varchar, -- example: "Alicia"
  name_as_fr varchar -- example: "Aalis"
);

--rollback drop table access_user;
