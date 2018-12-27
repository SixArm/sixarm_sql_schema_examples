--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'currency'

-- Currency 
-- http://schema.org/currency
--
-- Use standard formats:
--
--   * ISO 4217 currency format e.g. "USD" means United States dollars.
--
--   * Ticker symbol for cryptocurrencies e.g. "BTC" means Bitcoin.
--
--   * Well known names for Local Exchange Tradings Systems (LETS).
--
--   * Well known names for other currency types e.g. "Ithaca HOUR".
--
create table currency (
  id uuid not null primary key,
  name_as_en varchar, -- example: "United States dollars"
  name_as_es varchar, -- example: "dólares estadounidenses"
  name_as_fr varchar, -- example: "dollars américains"
  code varchar, -- example: "USD"
  iso_4217_code char(3), -- example: "USD"
);

--rollback drop table currency;
