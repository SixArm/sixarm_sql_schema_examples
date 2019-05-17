--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'money_transfer'

-- Money transfer
-- http://schema.org/MoneyTransfer
-- The act of transferring money from one place to another place. This may occur electronically or physically.

create table money_transfer (
  id uuid not null primary key,
  money_value_id uuid references money_value, -- example $1000 USD
  from_bank_account_id uuid references bank_account, -- example: Bank of America account #100
  to_bank_account_id uuid references bank_account -- example: Citibank account #200
);

create index idx_money_value_id on money_transfer(money_value_id);
create index idx_from_bank_account_id on money_transfer(from_bank_account_id);
create index idx_to_bank_account_id on money_transfer(to_bank_account_id;

--rollback drop table monetary_value;
