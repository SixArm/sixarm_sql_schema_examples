--liquibase formatted sql
--see http://www.liquibase.org/
--see https://en.wikipedia.org/wiki/Market_sector

--changeset sixarm@sixarm.com:1
create table market_sector (
  id int not null primary key,
  name_en varchar(255),               -- example: energy
  name_fr varchar(255)                -- example: énergie
);
--rollback drop table market_sector;
