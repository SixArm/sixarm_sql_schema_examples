--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_locality'

create table postal_locality (
  id int not null primary key,
  name varchar(255),                  -- example: San Francisco
  name_en varchar(255),               -- example: San Francisco
  name_fr varchar(255),               -- example: Saint François
  postal_region_id int,          -- example: California
  country_id int                 -- example: United States
);

--rollback drop table postal_locality;
