--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'geolocation'

-- Geolocation
-- https://en.wikipedia.org/wiki/Geolocation
-- A geographic location, such as on the surface of the earth

create table geolocation (
  id uuid not null primary key,
  latitude numeric(20,12), -- example: 37.8199° N (Golden Gate Bridge)
  longitude numeric(20,12), -- example: 122.4783° W (Golden Gate Bridge)
  altitude numeric(20,12), -- example: 67.056 meters (to local surface of the earth)
  elevation numeric(20,12), -- example: 67.056 meters (to global sea level)
);

--rollback drop table geolocation;
