--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'access_permission'

create table access_permission (
  id uuid not null primary key,
  access_attribute_id uuid references access_attribute, -- example: administrator
  access_operation_id uuid references access_operation, -- example: create item
  name_as_en varchar unique, -- example: administrator can create item
  name_as_es varchar unique, -- example: administrador puede crear ít"
  name_as_fr varchar unique -- example: administrateur pouvez créer article
);

create index idx_access_attribute_id on access_permission(access_attribute_id);
create index idx_access_operation_id on access_permission(access_operation_id);

--rollback drop table access_permission;
