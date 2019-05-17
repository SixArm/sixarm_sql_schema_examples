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
  global_location_number integer(13), -- https://schema.org/globalLocationNumber https://en.wikipedia.org/wiki/Global_Location_Number
  photo_uri varchar, -- example: https://example.com/photo.jpg
  vcard_vcf text, -- https://en.wikipedia.org/wiki/VCard
  hcard_html text, -- https://en.wikipedia.org/wiki/HCard
  value_added_tax_identification_number varchar, -- https://schema.org/vatID https://en.wikipedia.org/wiki/VAT_identification_number
  legal_entity_identifier char(20), -- https://schema.org/leiCode https://en.wikipedia.org/wiki/Legal_Entity_Identifier
  international_standard_of_industrial_classification_rev_4 char(5), -- https://schema.org/isicV4 https://en.wikipedia.org/wiki/International_Standard_Industrial_Classification
  lifespan_id uuid references lifespan -- example: origin date is 2000-01-01
);

--rollback drop table org;
