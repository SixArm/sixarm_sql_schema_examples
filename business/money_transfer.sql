--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'money_transfer'

-- Money transfer
-- http://schema.org/MoneyTransfer
--
create table money_transfer (
  id uuid not null primary key,
  money_value_id uuid references money_value, -- example $1000 USD
  from_bank_account_id uuid references bank_account, -- example: Bank of America account #100
  to_bank_account_id uuid references bank_account -- example: Citibank account #200
);

--rollback drop table monetary_value;
