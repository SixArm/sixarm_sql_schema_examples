--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'exchange_rate_specification'

-- Exchange rate specification
-- http://schema.org/ExchangeRateSpecification
-- A structured value representing an exchange rate.

create table exchange_rate_specification (
  id uuid not null primary key,
  currency_pair_id uuid references currency_pair, -- example: USD/BTC
  price_id uuid references monetary_value, -- example $1000 USD; schema.org `currentExchangeRate`
  spread_id uuid references monetary_range, -- example: $900 USD to $1100 USD; schema.org `exchangeRateSpread`
);

create index idx_currency_pair_id on exchange_rate_specification(currency_pair_id);
create index idx_price_id on exchange_rate_specification(price_id);
create index idx_spread_id on exchange_rate_specification(spread_id;

--rollback drop table exchange_rate_specification;
