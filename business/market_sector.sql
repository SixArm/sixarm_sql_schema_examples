--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'market_sector'

create table market_sector (
  id int not null primary key,
  name_en varchar,               -- example: energy
  name_fr varchar                -- example: énergie
);

--rollback drop table market_sector;
