--liquibase formatted sql
--see http://www.liquibase.org/
--see https://github.com/sixarm/sixarm_rails_engine_for_contacts

--changeset sixarm@sixarm.com:1
create table ftp_account (
  id int not null primary key,

  -- User Credentials
  user_id int,  
  username varchar(255),
  password varchar(255),

  -- FTP Server
  host varchar(255),
  port integer,
  use_ssl boolean
);
--rollback drop table ftp_account;
