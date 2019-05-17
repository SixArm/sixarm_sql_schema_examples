--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'lifespan'

-- Lifespan
-- https://en.wikipedia.org/wiki/Lifespan
-- How long something (such as a person) lives, from birth to death.

create table lifespan (
  id uuid not null primary key,
  birth_when timestamp, -- example: 2000-01-01T12:00:00Z
  birth_date_local date, -- example: 2000-01-01 Pacific Time Zone
  birth_time_local time, -- example: 12:00:00 Pacific Time Zone
  birth_place_id uuid references place, -- example: San Francisco General Hospital
  death_when timestamp, -- example: 2000-01-01T12:00:00Z
  death_date_local date, -- example: 2000-01-01 Pacific Time Zone
  death_time_local time, -- example: 12:00:00 Pacific Time Zone
  death_place_id uuid references place, -- example: San Francisco General Hospital
);

create index idx_birth_place_id on lifespan(birth_place_id);
create index idx_death_place_id on lifespan(death_place_id);

--rollback drop table lifespan;
