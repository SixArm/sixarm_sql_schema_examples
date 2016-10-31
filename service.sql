--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/Service

--changeset sixarm@sixarm.com:1
create table service (
  id int not null primary key,
  name_en varchar(20), -- example: hammer
  name_fr varchar(20), -- example: marteau
  sku varchar(255),    -- Stock Keeping Unit; example: part-1234
  brand_id int,        -- example: Acme Brand
  provider_id int,     -- example: Acme; relate to organization
);
--rollback drop table service;
