--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'payment_service'

-- Payment service
-- http://schema.org/PaymentService
-- A Service to transfer funds from a person or organization to a beneficiary person or organization.

create table payment_service (
  id uuid not null primary key,
  interest_rate decimal, -- example: 0.05 means 5% interest rate
  annual_percentage_rate decimal, -- example: 0.05% charged for borrowing, including fees, commissions, costs, etc.
  fees_and_commissions_specification_url varchar, -- example: description URL
  fees_and_commissions_specification_as_en varchar, -- example: description as English
  fees_and_commissions_specification_as_es varchar, -- example: description as Spanish
  fees_and_commissions_specification_as_fr varchar, -- example: description as French
);

--rollback drop table payment_service;
