--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM PG_TYPE WHERE typname = 'rag'

CREATE TYPE rag AS ENUM ('red', 'amber', 'green');

--rollback drop type rag;
