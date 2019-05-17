--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'region'

-- Region
-- https://schema.org/addressRegion
-- A geographic region, suitable for a country subdivision, or a postal address region, such as a U.S. state, Canadian province, etc.

create table region (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  country_subdivision_id uuid references country_subdivision, -- example: California
  iso_3166_2_code char(5), -- ISO 3166-2 code; example: US-CA
  name_as_en varchar, -- example: California
  name_as_es varchar, -- example: California
  name_as_fr varchar -- example: California
);

--rollback drop table region;
