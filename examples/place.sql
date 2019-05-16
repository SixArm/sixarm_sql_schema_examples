--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'place'

-- Place
-- http://schema.org/Place
-- An entity that has a somewhat fixed, physical extension.

create table place (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  global_location_number numeric(13), -- https://en.wikipedia.org/wiki/Global_Location_Number
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  neighborhood_id uuid references neighborhood, -- example: Mission district
  name_as_en varchar, -- example: Mission Dolores Park
  name_as_es varchar, -- example: parque Mission Dolores
  name_as_fr varchar, -- example: parc Mission Dolores Park
);

--rollback drop table place;
