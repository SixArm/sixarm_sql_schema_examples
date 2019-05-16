--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'street_address'

-- Street
-- https://schema.org/streetAddress
-- A street. For example Main Street.

create table street_address (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  postal_code_id uuid references postal_code, -- example: 94101
  name_as_en varchar, -- example: 123 Main Street
  name_as_es varchar, -- example: 123 Calle Principal
  name_as_fr varchar -- example: 123 Rue Principale
);

--rollback drop table street_address;
