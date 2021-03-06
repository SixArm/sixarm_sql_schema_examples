--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ftp_account'

-- FTP account
-- A file transfer protocol (FTP) account, such as for uploading/downloading files.

create table ftp_account (
  id uuid not null primary key,

 -- User Credentials
  user_id uuid references user, -- example: Alice  
  username varchar,
  password varchar,

 -- FTP Server
  host varchar,
  port integer,
  use_ssl boolean
);

create index idx_user_id on ftp_account(user_id);

--rollback drop table ftp_account;
