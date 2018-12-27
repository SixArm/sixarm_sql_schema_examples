--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'country'

create table country (
  id uuid not null primary key,
  name_as_en varchar,            -- example: United States
  name_as_fr varchar,            -- example: États Unis
  iso_alpha_2_code char(2),   -- ISO 3166 Alpha-2 code; example: US
  iso_alpha_3_code char(3),   -- ISO 3166 Alpha-3 code; example: USA
  iso_numeric_code char(3)    -- ISO United Nations M49 code; example: 840
);
--rollback drop table country;
