--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'thing'

create table thing (
  id uuid not null primary key,
  name_as_en varchar, -- example: apple
  name_as_as varchar, -- example "manzana"
  name_as_fr varchar, -- example: pomme
  description_as_en varchar, -- example: An apple is a fruit
  description_as_es varchar, -- example: Una manzana es una fruta
  description_as_fr varchar, -- example: Une pomme est un fruit
  image_url text, -- example: http://example.com/image.png
);

--rollback drop table thing;
