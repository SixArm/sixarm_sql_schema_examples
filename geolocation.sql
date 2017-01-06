--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/GeoCoordinates

--changeset sixarm@sixarm.com:1
create table geolocation (
  id int not null primary key,
  latitude float,                -- example: 37.8199° N (Golden Gate Bridge)
  longitude float,               -- example: 122.4783° W (Golden Gate Bridge)
  altitude float,                -- example: 67.056 meters (to local surface of the earth)
  elevation float,               -- example: 67.056 meters (to global sea level)
);
--rollback drop table geolocation;
