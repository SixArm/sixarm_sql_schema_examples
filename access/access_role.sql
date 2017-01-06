--liquibase formatted sql
--see http://www.liquibase.org/
--see https://github.com/sixarm/sixarm_rails_engine_for_rbac

--changeset sixarm@sixarm.com:1
create table access_role (
  id int not null primary key,
  name varchar(255) -- example: administrator
);
--rollback drop table access_role;
