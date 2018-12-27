--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'org'

create table org (
  id uuid not null primary key,
  name_as_en varchar, -- example: Acme Company
  name_as_es varchar, -- example: Acme Empressa
  name_as_fr varchar -- example: Acme Entreprise
);

--rollback drop table org;
