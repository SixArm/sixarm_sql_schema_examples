--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_address'

-- Postal address
-- http://schema.org/PostalAddress
-- A mailing address.

create table postal_address (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  country_subdivision_id uuid references country_subdivision, -- example: California
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  postal_code_id uuid references postal_code, -- example: 94101
  street_address_id uuid references street_address, -- example: 123 Main Street
  postal_box varchar, -- example: Box A1
  name_as_en varchar, -- example: Acme Company
  name_as_es varchar, -- example: Acme Empressa
  name_as_fr varchar, -- example: Acme Entreprise
);

create index idx_geolocation_id on postal_address(geolocation_id);
create index idx_country_id on postal_address(country_id);
create index idx_country_subdivision_id on postal_address(country_subdivision_id);
create index idx_region_id on postal_address(region_id);
create index idx_locality_id on postal_address(locality_id);
create index idx_postal_code_id on postal_address(postal_code_id);
create index idx_street_address_id on postal_address(street_address_id);

--rollback drop table postal_address;
