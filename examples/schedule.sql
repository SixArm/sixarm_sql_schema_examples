--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'schedule'

-- Schedule
-- https://schema.org/Schedule
-- A schedule defines a repeating time period used to describe a regularly occurring Event.

create table schedule (
  id uuid not null primary key,
  by_dates date array, -- example: 2020-01-01
  -- by days, weeks, months, years
  by_days integer array, -- example: 0 means Monday
  by_weeks integer array, -- example: 1 means January, the whole commercial week 1
  by_months integer array, -- example: 1 means January, the whole month
  by_years integer array, -- example: 2020 means 2020, the whole year
  -- by work days (Monday-Friday) and rest days (Saturday-Sunday)
  by_workday boolean, -- example: true means Monday-Friday
  by_restday boolean, -- example: true means Saturday-Sunday
  -- by combinations
  by_month_days integer array, -- example: 1 means each month, day 1
  by_year_days integer array, -- example: 1 means each year, day 1
  -- repeaters
  repeat_count integer, -- example: 8 means repeat 8 times
  repeat_frequency integer, -- example: 86400 seconds i.e. repeat every day
  -- naming etc.
  name_as_en varchar, -- example: sing at a music concert
  name_as_es varchar, -- example cantar en un concierto de musica
  name_as_fr varchar, -- example: chanter à concert de musique
  start_when timestamp, -- example: 2000-01-01T12:00:00Zs 
  start_date_local date, -- example: : 2000-01-01
  start_time_local time, -- example: 12:00:00 Pacific Time Zone
  stop_when timestamp, -- example: 2000-01-02T12:00:00Z
  stop_date_local date, -- example: : 2000-01-01 Pacific Time Zome
  stop_time_local time, -- example: 12:00:00 Pacific Time Zone
  duration integer, -- example: 86400 seconds a.k.a. 1 day
);

--rollback drop table schedule;
