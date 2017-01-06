--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table brand__market_sector (
  brand_id int,          -- example: Acme Brand
  market_sector_id int   -- example: Energy

);
--rollback drop table brand__market_sector;
