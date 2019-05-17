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
  vcard text, -- https://en.wikipedia.org/wiki/VCard
  hcard text -- https://en.wikipedia.org/wiki/HCard
);

--rollback drop table org;
