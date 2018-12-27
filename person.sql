--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'person'

create table person (
  id int not null primary key,
  given_name_en varchar55),         -- example: Alice
  given_name_fr varchar55),         -- example: Aalis
  family_name_en varchar55),        -- example: Anderson
  family_name_fr varchar55),        -- example: Anderçon
  additional_name_en varchar55),    -- example: Amy
  additional_name_fr varchar55),    -- example: Aimée
  height float,                       -- example: 1.65 meters
  weight float,                       -- example: 70000 grams 
  geolocation_id int,                 -- example: where the person is now
  lifespan_id int,                    -- example: birth date is 2000-01-01
);

--rollback drop table person;
