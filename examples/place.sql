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
  global_location_number integer(13), -- https://schema.org/globalLocationNumber https://en.wikipedia.org/wiki/Global_Location_Number
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  neighborhood_id uuid references neighborhood, -- example: Mission district
  postal_code_id uuid references postal_code, -- example: 94101 is San Francisco downtown
  street_address_id uuid references street_address_id, -- example: 123 Main Street
  name_as_en varchar, -- example: Mission Dolores Park
  name_as_es varchar, -- example: parque Mission Dolores
  name_as_fr varchar, -- example: parc Mission Dolores Park
  photo_uri varchar, -- example: https://example.com/photo.jpg
  international_standard_of_industrial_classification_rev_4 char(5) -- https://schema.org/isicV4 https://en.wikipedia.org/wiki/International_Standard_Industrial_Classification
);

create index idx_geolocation_id on place(geolocation_id);
create index idx_country_id on place(country_id);
create index idx_country_subdivision_id on place(country_subdivision_id);
create index idx_region_id on place(region_id);
create index idx_locality_id on place(locality_id);
create index idx_neighborhood_id on place(neighborhood_id);
create index idx_postal_code_id on place(postal_code_id);
create index idx_street_address_id on place(street_address_id);

--rollback drop table place;
