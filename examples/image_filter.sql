--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'image_filter'

-- Image filter
-- https://www.imagemagick.org
-- An image filter. For example, settings to shrink to fit.

create table image_filter ( --see ImageMagick image filter convert function paramters
  id uuid not null primary key,
  name_as_en varchar, -- example: Shrink to fit
  name_as_es varchar, -- example: encogerse para encajar
  name_as_fr varchar, -- example: rétrécir pour s'adapter
  geometry_x integer unsigned, -- the x width in pixels
  geometry_y integer unsigned, -- the y height in pixels
  quality_jpg integer unsigned, 
  quality_png_zlib_compression_level smallint(2) unsigned,
  quality_png_filtering_type smallint(2) unsigned,
  bytes_max integer(11) unsigned, -- upper limit of byte count
  dpi integer(10) unsigned, -- dots per inch
);

--rollback drop table image_filter;
