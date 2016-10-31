--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table brand__organization (
  brand_id int         -- example: Acme Brand
  organization_id int, -- example: Acme

);
--rollback drop table brand__organization;
