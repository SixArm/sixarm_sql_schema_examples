--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'neighborhood'

create table neighborhood (
  id int not null primary key,
  name_en varchar(255),               -- example: Mission district
  name_fr varchar(255),               -- example: Le district Mission
  postal_locality_id int,        -- example: San Francisco
  postal_region_id int,          -- example: California
  country_subdivision_id int,    -- example: California
  country_id int,                -- example: United States
);

--rollback drop table neighborhood;
