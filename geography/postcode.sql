--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postcode'

create table postcode (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references  country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  code varchar, -- example: 94101
);

--rollback drop table postcode;
