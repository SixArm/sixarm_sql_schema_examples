--liquibase formatted sql
--see http://www.liquibase.org/
--see https://en.wikipedia.org/wiki/Media_market

--changeset sixarm@sixarm.com:1
create table market_area (
  id int not null primary key,
  name_en varchar(255),               -- example: San Francisco Bay Area Region
  name_fr varchar(255),               -- example: Région de la baie de San Francisco
  rank int,                      -- example: 3
);
--rollback drop table market_area;