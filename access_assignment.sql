--liquibase formatted sql
--see http://www.liquibase.org/
--see https://github.com/sixarm/sixarm_rails_engine_for_rbac

--changeset sixarm@sixarm.com:1
create table access_assignment (
  id int not null primary key,
  name varchar(255),       -- example: Alice is an Administrator
  person_id int,           -- example: Alice
  access_role_id int       -- example: Administrator
);
--rollback drop table access_assignment;
