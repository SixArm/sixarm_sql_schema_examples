--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM PG_TYPE WHERE typname = 'rag'

-- RAG
-- https://en.wikipedia.org/wiki/RAG_status
-- A rating system for indicating the status of a variable using the colors red, amber, green, such as in traffic lights.

CREATE TYPE rag AS ENUM ('red', 'amber', 'green');

--rollback drop type rag;
