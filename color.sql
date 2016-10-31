--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
create table color (
  id int not null primary key,
  name_en varchar(20), -- example: red
  name_fr varchar(20), -- example: rouge
  hex char(6),         -- example: ff0000
  rgb_r smallint(2),   -- example: 255
  rgb_g smallint(2),   -- example: 0
  rgb_b smallint(2),   -- example: 0
);
--rollback drop table color;
