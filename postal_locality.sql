--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/PostalAddress

--changeset sixarm@sixarm.com:1
create table postal_locality (
  id int not null primary key,
  name varchar(255),                  -- example: San Francisco
  name_en varchar(255),               -- example: San Francisco
  name_fr varchar(255),               -- example: Saint François
  postal_region_id int,          -- example: California
  country_id int                 -- example: United States
);
--rollback drop table postal_locality;
