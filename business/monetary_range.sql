--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'monetary_range'

-- Monetary range 
-- http://schema.org/MonetaryAmount
--
create table monetary_range (
  id uuid not null primary key,
  currency_id uuid references currency, -- example: USD
  min_value money, -- example: 1000.00 meaning $1000.00 USD
  max_value money -- example: 1000.00 meaning $1000.00 USD
);

--rollback drop table monetary_range;
