--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tag'

create table tag (
  id int not null primary key,
  name_en varchar55),         -- example: hot
  name_fr varchar55),         -- example: chaud
);

--rollback drop table tag;
