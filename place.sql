--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'place'

create table place (
  id uuid not null primary key,
  name_as_en varchar, -- example: "Golden Gate Park"
  name_as_es varchar, -- example: "parque Golden Gate"
  name_as_fr varchar -- example: "parc Golden Gate"
);

--rollback drop table place;
