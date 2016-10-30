--liquibase formatted sql
--see http://www.liquibase.org/
--see https://github.com/sixarm/sixarm_rails_engine_for_rbac

--changeset sixarm@sixarm.com:1
create table access_permission (
  id int not null primary key,
  name varchar(255),        -- example: administrator can create item
  access_role_id int,       -- example: administrator
  access_operation_id int   -- example: create item
);
--rollback drop table access_permission;
