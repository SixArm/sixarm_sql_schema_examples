--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/PostalAddress

--changeset sixarm@sixarm.com:1
create table postal_region (
  id int not null primary key,
  name varchar(255),                  -- example: California
  name_en varchar(255),               -- example: California
  country_id int                 -- example: United States
);
--rollback drop table postal_region;
