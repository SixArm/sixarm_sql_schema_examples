--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'neighborhood'

create table neighborhood (
  id uuid not null primary key,
  name_as_en varchar, -- example: "Mission district"
  name_as_es varchar, -- example: "District de mission"
  name_as_fr varchar, -- example: "Le district Mission"
  postal_locality_id uuid,        -- example: San Francisco
  postal_region_id uuid,          -- example: California
  country_subdivision_id uuid,    -- example: California
  country_id uuid,                -- example: United States
);

--rollback drop table neighborhood;
