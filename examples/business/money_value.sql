--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'money_value'

-- Money value 
-- http://schema.org/MonetaryAmount
-- This type can be used to describe an amount of money such as $10 USD.

create table money_value (
  id uuid not null primary key,
  currency_id uuid references currency, -- example: USD
  value money -- example: 10.00 meaning $10.00 USD
);

create index idx_currency_id on money_value(currency_id);

--rollback drop table money_value;
