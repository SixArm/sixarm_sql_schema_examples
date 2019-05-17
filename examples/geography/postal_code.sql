--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_code'

-- postal_code
-- https://schema.org/postalCode
-- A postal code, such as 94101 meaning an area of San Francisco, California, US.

create table postal_code (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references  country, -- example: United States
  country_subdivision_id uuid references country_subdivision, -- example: California
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  code varchar, -- example: 94101
);

create index idx_geolocation_id on postal_code(geolocation_id);
create index idx_country_id on postal_code(country_id);
create index idx_country_subdivision_id on postal_code(country_subdivision_id);
create index idx_region_id on postal_code(region_id);
create index idx_locality_id on postal_code(locality_id);

--rollback drop table postal_code;
