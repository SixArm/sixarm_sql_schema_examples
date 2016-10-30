--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/PostalAddress

--changeset sixarm@sixarm.com:1
create table postal_code (
  id int not null primary key,
  name,                          -- example: 94101
  postal_locality_id int,        -- example: San Francisco
  postal_region_id int,          -- example: California
  country_id int                 -- example: United States
);
--rollback drop table postal_code;
