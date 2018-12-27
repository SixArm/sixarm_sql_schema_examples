--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'color'

create table color (
  id uuid not null primary key,
  name_as_en varchar, -- example: red
  name_as_es varchar, -- example: rojo
  name_as_fr varchar, -- example: rouge
  hex char(6), -- example: ff0000
  rgb_255_r smallint(2), -- example: 255
  rgb_255_g smallint(2), -- example: 0
  rgb_255_b smallint(2), -- example: 0
);

--rollback drop table color;
