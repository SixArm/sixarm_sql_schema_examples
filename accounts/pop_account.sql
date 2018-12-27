--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pop_account'

create table pop_account (
  id int not null primary key,

  -- User Credentials
  user_id int,  
  email_address varchar,
  username varchar,
  password varchar,

  -- Inbound Mail Server (POP)
  inbound_mail_host varchar,
  inbound_mail_port integer,
  inbound_mail_port_for_ssl integer,
  inbound_mail_use_ssl boolean,

  -- Outbound Mail Server (SMTP)
  outbound_mail_host varchar,
  outbound_mail_port integer,
  outbound_mail_port_for_ssl integer,
  outbound_mail_port_for_tls integer,
  outbound_mail_use_authentication boolean,
  outbound_mail_use_ssl boolean,
  outbound_mail_use_tls boolean,

);
--rollback drop table pop_account;
