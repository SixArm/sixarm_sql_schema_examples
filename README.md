# SixArm → SQL → Schema examples

Contents:

* [Schema example files here](#schema-example-files-here)
* [Schema conventions](#schema-conventions)
* [Bonus fields for growth](#bonus-fields-for-growth)
* [Liquibase introduction](#liquibase-introduction)
* [Why we use Liquibase SQL vs. XML vs. YAML](#why-we-use-liquibase-sql-vs-xml-vs-yaml)
* [Tracking](#tracking)


## Schema example files

Most popular:

  * [person.sql](person.sql)
  * [place.sql](place.sql)
  * [thing.sql](thing.sql)
  * [org.sql](org.sql)
  * [event.sql](event.sql)
  * [action.sql](action.sql)
  * [tag.sql](tag.sql)
  * [color.sql](color.sql)

Access control:

  * [access_user.sql](access/access_user.sql)
  * [access_assigment.sql](access/access_assignment.sql)
  * [access_attribute.sql](access/access_attribute.sql)
  * [access_permission.sql](access/access_permission.sql)
  * [access_operation.sql](access/access_operation.sql)

Geography:

  * [geolocation.sql](geography/geolocation.sql)
  * [country.sql](geography/country.sql)
  * [country_subdivision.sql](geography/country_subdivision.sql)
  * [region.sql](geography/region.sql)
  * [locality.sql](geography/locality.sql)
  * [street.sql](geography/street.sql)
  * [neighborhood.sql](geography/neighborhood.sql)
  * [postcode.sql](geography/postcode.sql)
  * [postal_address.sql](postal/postal_address.sql)

Business:

  * [brand.sql](business/brand.sql)
  * [product.sql](business/product.sql)
  * [offer.sql](business/offer.sql)
  * [market_area.sql](business/market_area.sql)
  * [market_sector.sql](business/market_sector.sql)

Accounts:

  * [bank_account.sql](accounts/bank_account.sql)
  * [ftp_account.sql](accounts/ftp_account.sql)
  * [pop_account.sql](accounts/pop_account.sql)

Misc:

  * [rag.sql](rag.sql)
  * [image_filter.sql](image_filter.sql)
  * [lifespan.sql](lifespan.sql)


## Schema conventions

Use industry standard schemas such as the Schema.org project.

  * For example, a postal address has a field for "locality", not "city".

Use scientific measurement units.

  * For example, a "height" field uses meters, not feet nor inches.

Use a table name that is singular, not plural.

  * For example, the examples have a "person" table, not "persons" nor "people".

Use a language code suffix when a text field could be different in different languages.

  * For example, a person's name in English is "Amy" and in French is "Aimée", so use fields "name_as_en" and "name_as_fr".

If a field can be a relation or freeform text, use two fields, one with suffix "_id" and one with suffix "_ie" meaning "I.e., in other words".

  * For example, a "status_id" field is a relation to the "status" table, and a "status_ie" field is freeform text a user can type.

Use denormalization if it's likely to speed up typical usage.

  * For example, some tables duplicate the "postal_code" field, because many of our apps use it to speed up local search.

Use dates formats and time formats that are consistent with ISO standard formats.

  * For example, the format is Year-Month-Day and Hour:Minute:Second and Zulu time zone, such as "YYYY-MM-DDTHH:MM:SSZ".

Any date or time that must be local must use the "_local" suffix.

  * For example, the "person" table has the "birth_date_local" field because we care about the person's local date birthday, not Zulu date birthday.

Handling corner cases well is more important than saving data space.

  * For example, the concepts of a "region" and "country_subdivision" are nearly identical, but not quite, so we store both.

Use typical data type default sizes.

  * For example, we use the data type "varchar" as a default, when we don't know a text field will be somewhat short.

Use some of our notable exceptions because they are better at scale.

  * For example, for range naming we use "start" and "stop", not "begin" and "end", nor "from" and "to".


## Bonus fields for growth


In practice we often add some bonus fields to each table; these fields help us with the growth of the app, and also the administration of the app.

Examples:


```sql
-- We prefer using secure random 128-bit numbers as primary keys.
-- These numbers are storable in a typical PostgreSQL UUID field.
id uuid not null primary key,

-- An incrementing number that an application can
-- use for optimistic locking for read/write speed
lock_version int,

-- Track who touches the record and when,
-- because this information helps in practice
-- for diagnosing the application as it runs.
created_at timestamp, created_by uuid references user,
updated_at timestamp, updated_by uuid references user,
proofed_at timestamp, updated_by uuid references user,
retired_at timestamp, retired_by uuid references user,

-- The field name "type" is a reserved word in some frameworks,
-- which uses the field for single-table inheritance.
type varchar,

-- The field name "position" is a reserved word in some frameworks,
-- which uses the field for ordering by position index number.
position integer,

-- For a record that has a direct parent record
parent_id uuid references self,

-- Status table suitable for the app
status_id uuid references status,
status_ie varchar,

-- Ways to see more about the record, such as a URL to more information, and a note of text.
url varchar,
note longtext,
```


## Liquibase introduction

Liquibase is an open source tool for managing database schema changes.

See https://en.wikipedia.org/wiki/Liquibase

Our projects use database schema changes within source code, and within large projects, so we have schema examples here to help new projects.


## Why we use Liquibase SQL vs. XML vs. YAML

Liquibase files can be written in SQL, or XML, or YAML. We prefer SQL because more database administrators know it.

If you prefer XML or YAML and would like to translate our examples, then we welcome the help and also welcome pull requests.


## Tracking

* Package: sixarm_sql_schema_examples
* Version: 5.0.0
* Created: 1996-01-01
* Updated: 2018-12-28
* License: BSD, MIT, GPL
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
