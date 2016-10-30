--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Person

--changeset sixarm@sixarm.com:1
create table lifespan (
  id int not null primary key,
  birth_date_local date,         -- example: 2000-01-01
  birth_datetime datetime,       -- example: 2000-01-01T12:00:00Z
  birth_datetime_local datetime, -- example: 2000-01-01T12:00:00 Pacific
  birth_place_id,                -- example: San Francisco General Hospital
  death_date_local date,         -- example: 2000-01-01
  death_datetime datetime,       -- example: 2000-01-01T12:00:00Z
  death_datetime_local datetime, -- example: 2000-01-01T12:00:00 Pacific
  death_place_id,                -- example: San Francisco General Hospital
);
--rollback drop table lifespan;
