--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'person'

-- Person
-- https://schema.org/Person
-- A person (alive, dead, fictional, etc.)

create table person (
  id uuid not null primary key,
  given_name_as_en varchar, -- example: Alice
  given_name_as_es varchar, -- example: Alice
  given_name_as_fr varchar, -- example: Aalis
  family_name_as_en varchar, -- example: Anderson
  family_name_as_es varchar, -- example: Anderson
  family_name_as_fr varchar, -- example: Anderçon
  additional_name_as_en varchar, -- example: Amy
  additional_name_as_es varchar, -- example: Amé
  additional_name_as_fr varchar, -- example: Aimée
  height float, -- example: 1.65 meters
  mass float, -- example: 70000 grams 
  geolocation_id uuid references geolocation, -- example: where the person is now
  global_location_number decimal(13), -- https://en.wikipedia.org/wiki/Global_Location_Number
  lifespan_id uuid references lifespan -- example: birth date is 2000-01-01
);

--rollback drop table person;
