--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'market_area'

create table market_area (
  id uuid not null primary key,
  name_as_en varchar, -- example: "San Francisco Bay Area Region"
  name_as_es varchar, -- exmaple: "Región de la Bahía de San Francisco"
  name_as_fr varchar, -- example: "Région de la baie de San Francisco"
  rank int, -- example: 3
);

--rollback drop table market_area;