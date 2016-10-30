--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/GeoCoordinates

--changeset sixarm@sixarm.com:1
create table geolocation (
  id int not null primary key,
  latitude float,                -- example: 37.8199° N 
  longitude float,               -- example: 122.4783° W
  elevation float,               -- example: 67.056 meters
);
--rollback drop table geolocation;
