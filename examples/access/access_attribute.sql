--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_attribute'

create table access_attribute (
  id uuid not null primary key,
  name_as_en varchar unique, -- example: administrator
  name_as_es varchar unique, -- example: administrador
  name_as_fr varchar unique -- example: administrateur
);

--rollback drop table access_attribute;
