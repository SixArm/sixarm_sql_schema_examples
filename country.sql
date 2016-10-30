--liquibase formatted sql
--see http://www.liquibase.org/
--see https://schema.org/PostalAddress

--changeset sixarm@sixarm.com:1
create table country (
  id int not null primary key,
  name_en varchar(255),            -- example: United States
  name_fr varchar(255),            -- example: États Unis
  iso_alpha_2_code char(2),   -- ISO 3166 Alpha-2 code; example: US
  iso_alpha_3_code char(3),   -- ISO 3166 Alpha-3 code; example: USA
  iso_numeric_code char(3)    -- ISO United Nations M49 code; example: 840
);
--rollback drop table country;
