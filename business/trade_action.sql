--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'trade_action'

-- Trade action
-- https://schema.org/TradeAction
-- The act of participating in an exchange of goods and services for monetary compensation. An agent trades an object, product or service with a participant in exchange for a one time or periodic payment.

create table trade_action (
  id uuid not null primary key,
  money_value_id uuid references money_value, -- example $10 USD
);

--rollback drop table trade_action;
