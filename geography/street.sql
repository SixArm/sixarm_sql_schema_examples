--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'street'

-- Street
-- https://schema.org/streetAddress
-- A street. For example Main Street.

create table street (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  postcode_id uuid references postcode, -- example: 94101
  name_as_en varchar, -- example: Main Street
  name_as_es varchar, -- example: Calle Principal
  name_as_fr varchar -- example: Rue Principale
);

--rollback drop table street;
