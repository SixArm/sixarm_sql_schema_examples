--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/PostalAddress

--changeset sixarm@sixarm.com:1
create table postal_address (
  id int not null primary key,
  name varchar(255),                  -- example: Acme Company
  street_address varchar(255),        -- example: 123 Main Street
  postal_box_number varchar(255),     -- example: 12345
  postal_code_id int,            -- example: 94101
  postal_locality_id int,        -- example: San Francisco
  postal_region_id int,          -- example: California
  country_id int                 -- example: United States
);
--rollback drop table postal_address;