# SixArm → SQL → Schema examples

Contents:

* [Schema example files here](#schema-example-files-here)
* [Schema conventions](#schema-conventions)
* [Bonus fields for growth](#bonus-fields-for-growth)
* [Liquibase introduction](#liquibase-introduction)
* [Why we use Liquibase SQL vs. XML vs. YAML](#why-we-use-liquibase-sql-vs-xml-vs-yaml)
* [Tracking](#tracking)


## Schema examples

Most popular:

  * [person.sql\]\(examples/person.sql)
  * [place.sql\]\(examples/place.sql)
  * [thing.sql\]\(examples/thing.sql)
  * [org.sql\]\(examples/org.sql)
  * [event.sql\]\(examples/event.sql)
  * [action.sql\]\(examples/action.sql)
  * [tag.sql\]\(examples/tag.sql)
  * [color.sql\]\(examples/color.sql)

Access control:

  * [access_user.sql\]\(examples/access/access_user.sql)
  * [access_assigment.sql\]\(examples/access/access_assignment.sql)
  * [access_attribute.sql\]\(examples/access/access_attribute.sql)
  * [access_permission.sql\]\(examples/access/access_permission.sql)
  * [access_operation.sql\]\(examples/access/access_operation.sql)

Geography:

  * [geolocation.sql\]\(examples/geography/geolocation.sql)
  * [country.sql\]\(examples/geography/country.sql)
  * [country_subdivision.sql\]\(examples/geography/country_subdivision.sql)
  * [region.sql\]\(examples/geography/region.sql)
  * [locality.sql\]\(examples/geography/locality.sql)
  * [street_address.sql\]\(examples/geography/street_address.sql)
  * [neighborhood.sql\]\(examples/geography/neighborhood.sql)
  * [postal_code.sql\]\(examples/geography/postal_code.sql)
  * [postal_address.sql\]\(examples/postal/postal_address.sql)

Business:

  * [brand.sql\]\(examples/business/brand.sql)
  * [currency.sql\]\(examples/business/currency.sql)
  * [currency_conversion_service.sql\]\(examples/business/currency_conversion_service.sql)
  * [currency_pair.sql\]\(examples/business/currency_pair.sql)
  * [exchange_rate_specification.sql\]\(examples/business/exchange_rate_specification.sql)
  * [market_area.sql\]\(examples/business/market_area.sql)
  * [market_sector.sql\]\(examples/business/market_sector.sql)
  * [money_range.sql\]\(examples/business/money_range.sql)
  * [money_transfer.sql\]\(examples/business/money_transfer.sql)
  * [money_value.sql\]\(examples/business/money_value.sql)
  * [offer.sql\]\(examples/business/offer.sql)
  * [payment_service.sql\]\(examples/business/payment_service.sql)
  * [product.sql\]\(examples/business/product.sql)
  * [trade_action.sql\]\(examples/business/trade_action.sql)

Accounts:

  * [bank_account.sql\]\(examples/accounts/bank_account.sql)
  * [ftp_account.sql\]\(examples/accounts/ftp_account.sql)
  * [pop_account.sql\]\(examples/accounts/pop_account.sql)

Misc:

  * [rag.sql\]\(examples/rag.sql)
  * [image_filter.sql\]\(examples/image_filter.sql)
  * [lifespan.sql\]\(examples/lifespan.sql)


## Schema conventions

Use industry standard schemas such as the Schema.org project.

  * For example, a postal address has a field for "locality", not "city".

Use scientific measurement units.

  * For example, a "height" field uses meters, not feet nor inches.

Use a table name that is singular, not plural.

  * For example, the examples have a "person" table, not "persons" nor "people".

Use a language code suffix when a text field could be different in different languages.

  * For example, a person's name in English is "Amy" and in French is "Aimée", so use fields "name_as_en" and "name_as_fr".

If a field can be a relation and/or freeform text, use two fields, one with suffix "_id" and one with suffix "_ie" meaning "I.e., in other words".

  * For example, a "status_id" field is a relation to the "status" table, and a "status_ie" field is freeform text a user can type.

Use denormalization if it's likely to speed up typical usage.

  * For example, some tables duplicate the "postal_code" field, because many of our apps use it to speed up local search.

Use date formats and time formats that are consistent with ISO standard formats.

  * For example, the timestamp display format is Year-Month-Day and Hour:Minute:Second and Zulu time zone, such as "YYYY-MM-DDTHH:MM:SSZ"

Any date or time field that is representing local time must use the "_local" suffix because this helps with disambiguation.

  * For example, the "person" table has the "birth_date_local" field because we care about the person's local date birthday, not Zulu date birthday.

Handling corner cases well is more important than saving data space.

  * For example, the concepts of a "region" and "country_subdivision" are nearly identical, but not quite, so we store both.

Use typical data type default sizes.

  * For example, we use the data type "varchar" as a default, when we don't know a text field will be somewhat short.

Use some of our notable exceptions because they are better at scale.

  * For example, for range naming we use "start" and "stop", not "begin" and "end", nor "from" and "to".

Use numeric data type with a large range, rather than float data type, because we prefer consistency over fluidity.

  * For example, we prefer numeric(20,12) as a general-purpose number type; you can change these as you like.


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
created_at timestamptz, created_by uuid references user,
updated_at timestamptz, updated_by uuid references user,
proofed_at timestamptz, proofed_by uuid references user,
retired_at timestamptz, retired_by uuid references user,

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


## Conventions

We use conventions for our databases and SQL that are our preferences. You may want to edit the files here for your own preferences.

* We prefer singular table names, rather than plural table names. For example, we prefer the table name "item" rather than the table name "items".

* We prefer lowercase SQL, rather than uppercase SQL. For example, we prefer "create table" rather than "CREATE TABLE".


## Languages

We prefer to work with multiple languages. For example, we often use English, Spanish, Chinese, and many other languages.

We use a naming convention of "{field}_as_{language}" such as "name_as_en" that means "the name as English", "name_as_es"

For the example files here, we list English and Spanish, so you can see how multiple languages can work.

You can add more languages if you want.

Some developers prefer different ways of handling languages, naming, internationalization, and localization. You can customize the files as you like for your goals.


## Tracking

* Package: sixarm_sql_schema_examples
* Version: 7.0.0
* Created: 1996-01-01
* Updated: 2019-05-09
* License: BSD, MIT, GPL
* Contact: Joel Parker Henderson (http://joelparkerhenderson.com)
