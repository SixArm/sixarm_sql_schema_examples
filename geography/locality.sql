--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'locality'

-- Locality
-- https://schema.org/addressLocality
-- A locality is a geographic area, such as a city, town, village, etc.

create table locality (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  name_as_en varchar, -- example: San Francisco
  name_as_es varchar, -- example: San Francisco
  name_as_fr varchar -- example: Saint François
);

--rollback drop table locality;
