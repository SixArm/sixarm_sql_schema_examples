--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'neighborhood'

-- Locality
-- https://en.wikipedia.org/wiki/Neighbourhood
-- A geographically localised community within a larger city, town, suburb or rural area.

create table neighborhood (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  name_as_en varchar, -- example: Mission district
  name_as_es varchar, -- example: District de mission
  name_as_fr varchar, -- example: Le district Mission
  
);

--rollback drop table neighborhood;
