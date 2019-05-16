--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'offer'

-- Offer
-- https://schema.org/Offer
-- An offer to transfer some rights to an item or to provide a service — for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.

create table offer (
  id uuid not null primary key,
  name_as_en varchar, -- example: Buy one get one free
  name_as_es varchar, -- example: Compre uno y llévese otro gratis
  name_as_fr varchar, -- example: Acheter un en obtenir un gratuitement
  start_when timestamp, -- example: 2000-01-01T12:00:00; a.k.a. valid from
  stop_when timestamp, -- example: 2000-01-01T12:00:00; a.k.a. valid through
  organization_id uuid references organization, -- example: Acme
  brand_id uuid references brand, -- example: Acme Brand
  product_id uuid references product -- example: Acme Brand Hammer
);

--rollback drop table offer;
