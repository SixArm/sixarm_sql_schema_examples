--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'exchange_rate_specification'

-- Exchange rate specification
-- http://schema.org/ExchangeRateSpecification
--
create table exchange_rate_specification (
  id uuid not null primary key,
  currency_pair_id uuid references currency_pair, -- example: USD/BTC
  price uuid references monetary_value, -- example $1000 USD; schema.org `currentExchangeRate`
  spread uuid references monetary_range, -- example: $900 USD to $1100 USD; schema.org `exchangeRateSpread`
);

--rollback drop table exchange_rate_specification;
