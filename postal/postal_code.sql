--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_code'

create table postal_code (
  id uuid not null primary key,
  name, -- example: 94101
  postal_locality_id uuid, -- example: San Francisco
  postal_region_id uuid, -- example: California
  country_id uuid -- example: United States
);

--rollback drop table postal_code;
