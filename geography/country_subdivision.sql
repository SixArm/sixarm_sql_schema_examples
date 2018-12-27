--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'country_subdivision'

create table country_subdivision (
  id int not null primary key,
  name_en varchar(255),            -- example: California
  name_fr varchar(255),            -- example: Californie
  iso_code char(5),           -- ISO 3166-2 code; example: US-CA
  country_id int              -- example: United States
);

--rollback drop table country_subdivision;
