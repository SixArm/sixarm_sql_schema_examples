--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Offer

--changeset sixarm@sixarm.com:1
create table offer (
  id int not null primary key,
  name_en varchar(20), -- example: Buy one get one free
  name_fr varchar(20), -- example: Acheter un en obtenir un gratuitement
  start datetime,      -- example: 2000-01-01T12:00:00; a.k.a. valid from
  stop  datetime,      -- example: 2000-01-01T12:00:00; a.k.a. valid through
  organization_id int, -- example: Acme
  brand_id int,        -- example: Acme Brand
  product_id int       -- example: Acme Brand Hammer
);
--rollback drop table offer;
