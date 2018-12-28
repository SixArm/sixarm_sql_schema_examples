--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'currency_pair'

-- Currency pair 
-- http://schema.org/Currency
--
create table currency_pair (
  id uuid not null primary key,
  a uuid references currency,
  b uuid references currency
);

--rollback drop table currency_pair;
