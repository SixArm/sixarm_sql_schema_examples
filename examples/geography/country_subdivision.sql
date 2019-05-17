--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'country_subdivision'

-- Country subdivision
-- http://schema.org/Country
-- A country subdivision, as defined by ISO, such as a U.S. state, a Canadian provice, etc.

create table country_subdivision (
  id uuid not null primary key,
  geolocation_id uuid references geolocation, -- example: center point of area
  country_id uuid references country, -- example: United States
  name_as_en varchar, -- example: California
  name_as_es varchar, -- example: California
  name_as_fr varchar, -- example: California
  iso_code char(5) -- ISO 3166-2 code; example: US-CA
);

create index idx_geolocation_id on country_subdivision(geolocation_id);
create index idx_country_id on country_subdivision(country_id);

--rollback drop table country_subdivision;
