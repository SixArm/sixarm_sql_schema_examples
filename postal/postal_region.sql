--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_region'

create table postal_region (
  id uuid not null primary key,
  name varchar, -- example: California
  name_as_en varchar, -- example: California
  country_id uuid -- example: United States
);

--rollback drop table postal_region;
