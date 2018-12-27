--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_operation'

create table access_operation (
  id uuid not null primary key,
  name_as_en varchar unique, -- example: create item
  name_as_es varchar unique, -- example: crear ít
  name_as_fr varchar unique -- example: créer article
);

--rollback drop table access_operation;
