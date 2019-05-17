--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'org'

-- Org
-- https://schema.org/Organization
-- An organization such as a company, school, nonprofit, club, team, etc.

create table org (
  id uuid not null primary key,
  name_as_en varchar, -- example: Acme Company
  name_as_es varchar, -- example: Acme Empressa
  name_as_fr varchar, -- example: Acme Entreprise
  geolocation_id uuid references geolocation, -- example: where the org is based
  global_location_number integer(13), -- https://en.wikipedia.org/wiki/Global_Location_Number
  photo_uri varchar, -- example: https://example.com/photo.jpg
  vcard_vcf text, -- https://en.wikipedia.org/wiki/VCard
  hcard_html text, -- https://en.wikipedia.org/wiki/HCard
  vatin varchar, -- https://en.wikipedia.org/wiki/VAT_identification_number
  lifespan_id uuid references lifespan -- example: birth date is 2000-01-01
);

--rollback drop table org;
