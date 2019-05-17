--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'thing'

-- Thing
-- http://schema.org/Thing
-- The most generic type of item.

create table thing (
  id uuid not null primary key,
  name_as_en varchar, -- example: book
  name_as_es varchar, -- example: libro
  name_as_fr varchar, -- example: livre
  description_as_en varchar, -- example: This book is red.
  description_as_es varchar, -- example: Este libro es rojo.
  description_as_fr varchar, -- example: Ce livre est rouge.
  height numeric(20,12), -- as meters
  width numeric(20,12), -- as meters
  depth numeric(20,12), -- as meters
  mass numeric(20,12), -- as grams
  color_id uuid references color, -- example: red
  geolocation_id uuid references geolocation, -- example: where the thing is now
  global_location_number integer(13), -- https://en.wikipedia.org/wiki/Global_Location_Number
  photo_uri varchar, -- example: https://example.com/photo.jpg
  lifespan_id uuid references lifespan -- example: origin date is 2000-01-01
);

--rollback drop table thing;
