--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'region'

create table region (
  id uuid not null primary key,
  country_id uuid references country, -- example: United States
  iso_3166_2_code char(5), -- ISO 3166-2 code; example: US-CA
  name_as_en varchar, -- example: California
  name_as_es varchar, -- example: California
  name_as_fr varchar -- example: California
);

--rollback drop table region;