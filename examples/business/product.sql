--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'product'

-- Product
-- http://schema.org/Product
-- Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.

create table product (
  id uuid not null primary key,
  name_as_en varchar, -- example: hammer
  name_as_es varchar, -- example: martillo
  name_as_fr varchar, -- example: marteau
  sku varchar, -- Stock Keeping Unit; example: part-1234
  brand_id uuid references brand, -- example: Acme Brand
  manufacturer_id uuid references organization, -- example: Acme
  height numeric(20,12), -- as meters
  width numeric(20,12), -- as meters
  depth numeric(20,12), -- as meters
  mass numeric(20,12), -- as grams
  color_id uuid references color, -- example: red
 -- Global Trade Item Number (GTIN)
  gtin8 char(8), -- The GTIN-8 code
  gtin12 char(12), -- The GTIN-12 code
  gtin13 char(13), -- The GTIN-13 code
  gtin14 char(14), -- The GTIN-14 code
);

create index idx_brand_id on product(brand_id);
create index idx_manufacturer_id on product(manufacturer_id);
create index idx_color_id on product(color_id);

--rollback drop table product;
