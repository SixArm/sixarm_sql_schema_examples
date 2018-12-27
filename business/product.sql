--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'product'

create table product (
  id uuid not null primary key,
  name_as_en varchar, -- example: hammer
  name_as_es varchar, -- example: martillo
  name_as_fr varchar, -- example: marteau
  sku varchar, -- Stock Keeping Unit; example: part-1234
  brand_id uuid references brand, -- example: Acme Brand
  manufacturer_id uuid references organization, -- example: Acme
  height float,
  width float,
  depth float,
  weight float,
  color_id uuid references color, -- example: red
 -- Global Trade Item Number (GTIN)
  gtin8 char(8), -- The GTIN-8 code
  gtin12 char(12), -- The GTIN-12 code
  gtin13 char(13), -- The GTIN-13 code
  gtin14 char(14), -- The GTIN-14 code
);

--rollback drop table product;
