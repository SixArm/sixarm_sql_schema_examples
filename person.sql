--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Person

--changeset sixarm@sixarm.com:1
create table person (
  id int not null primary key,
  given_name_en varchar(255),         -- example: Alice
  given_name_fr varchar(255),         -- example: Aalis
  family_name_en varchar(255),        -- example: Anderson
  family_name_fr varchar(255),        -- example: Anderçon
  additional_name_en varchar(255),    -- example: Amy
  additional_name_fr varchar(255),    -- example: Aimée
  height float,                  -- example: 1.65 meters
  weight float,                  -- example: 70000 grams 
  geolocation_id int,            -- example: where the person is now
  lifespan_id int,               -- example: birth date is 2000-01-01
);
--rollback drop table person;
