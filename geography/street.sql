--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'street'

create table street (
  id uuid not null primary key,
  country_id uuid references country, -- example: country "United States"
  region_id uuid references region, -- example: region "California"
  locality_id uuid references locality, -- example: locality "San Francisco"
  postcode_id uuid references postcode, -- example: locality "94101"
  name_as_en varchar, -- example: "Main Street"
  name_as_es varchar, -- example: "Calle Principal"
  name_as_fr varchar -- example: "Rue Principale"
);

--rollback drop table street;
