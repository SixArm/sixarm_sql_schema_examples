--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'postal_address'

create table postal_address (
  id uuid not null primary key,
  country_id uuid references country, -- example: United States
  postal_region_id uuid references region, -- example: California
  locality_id uuid references locality, -- example: San Francisco
  postcode_id uuid references postcode, -- example: 94101
  street_id uuid references street, -- example: Main Street
  name_as_en varchar, -- example: Acme Company
  name_as_es varchar, -- example: Acme Empressa
  name_as_fr varchar, -- example: Acme Entreprise
  street_address varchar, -- example: 123 Main Street
  postal_box_number varchar -- example: 12345
);

--rollback drop table postal_address;
