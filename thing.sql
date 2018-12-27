--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'thing'

create table thing (
  id int not null primary key,
  name_en varchar55),         -- example: apple
  name_fr varchar55),         -- example: pomme
  description_en text,          -- example: An apple is a fruit
  description_fr text,          -- example: Une pomme est un fruit
  image_url text,               -- example: http://example.com/image.png
);

--rollback drop table thing;
