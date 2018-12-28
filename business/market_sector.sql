--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'market_sector'

-- Market sector
-- https://en.wikipedia.org/wiki/Market_sector
-- A business marketing conceptual area, such as for clustering products and servies, e.g. "Energy", "Food & Beverage", "Health Care".

create table market_sector (
  id uuid not null primary key,
  name_as_en varchar, -- example: energy
  name_as_es varchar, -- example: energía
  name_as_fr varchar -- example: énergie
 );

--rollback drop table market_sector;
