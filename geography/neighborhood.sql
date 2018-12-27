--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'neighborhood'

create table neighborhood (
  id uuid not null primary key,
  country_id uuid references country, -- example: United States
  region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  name_as_en varchar, -- example: Mission district
  name_as_es varchar, -- example: District de mission
  name_as_fr varchar, -- example: Le district Mission
  
);

--rollback drop table neighborhood;
