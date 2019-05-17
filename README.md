# SixArm → SQL → Schema examples

Contents:

* [Schema examples](#schema-examples)
* [Schema conventions](#schema-conventions)
  * [General standardizations](#general-standardizations)
  * [Date and time standardization](#date-and-time-standardization)
  * [Our data naming conventions](#our-data-naming-conventions)
  * [Types](#types)
  * [Optimizations](#optimizations)
* [Bonus fields for growth](#bonus-fields-for-growth)
* [Liquibase annotation](#liquibase-annotation)
  * [Why we use Liquibase SQL vs. XML vs. YAML](#why-we-use-liquibase-sql-vs-xml-vs-yaml)
* [Conventions](#conventions)
* [Languages](#languages)
* [Tracking](#tracking)


## Schema examples

Most popular:

  * [person](examples/person.sql)
  * [place](examples/place.sql)
  * [thing](examples/thing.sql)
  * [org](examples/org.sql)
  * [event](examples/event.sql)
  * [action](examples/action.sql)
  * [tag](examples/tag.sql)
  * [color](examples/color.sql)

Access control:

  * [access_user](examples/access/access_user.sql)
  * [access_assigment](examples/access/access_assignment.sql)
  * [access_attribute](examples/access/access_attribute.sql)
  * [access_permission](examples/access/access_permission.sql)
  * [access_operation](examples/access/access_operation.sql)

Geography:

  * [geolocation](examples/geography/geolocation.sql)
  * [country](examples/geography/country.sql)
  * [country_subdivision](examples/geography/country_subdivision.sql)
  * [region](examples/geography/region.sql)
  * [locality](examples/geography/locality.sql)
  * [street_address](examples/geography/street_address.sql)
  * [neighborhood](examples/geography/neighborhood.sql)
  * [postal_code](examples/geography/postal_code.sql)
  * [postal_address](examples/postal/postal_address.sql)

Business:

  * [brand](examples/business/brand.sql)
  * [currency](examples/business/currency.sql)
  * [currency_conversion_service](examples/business/currency_conversion_service.sql)
  * [currency_pair](examples/business/currency_pair.sql)
  * [exchange_rate_specification](examples/business/exchange_rate_specification.sql)
  * [market_area](examples/business/market_area.sql)
  * [market_sector](examples/business/market_sector.sql)
  * [money_range](examples/business/money_range.sql)
  * [money_transfer](examples/business/money_transfer.sql)
  * [money_value](examples/business/money_value.sql)
  * [offer](examples/business/offer.sql)
  * [payment_service](examples/business/payment_service.sql)
  * [product](examples/business/product.sql)
  * [trade_action](examples/business/trade_action.sql)

Accounts:

  * [bank_account](examples/accounts/bank_account.sql)
  * [ftp_account](examples/accounts/ftp_account.sql)
  * [pop_account](examples/accounts/pop_account.sql)

Misc:

  * [rag](examples/rag.sql)
  * [image_filter](examples/image_filter.sql)
  * [lifespan](examples/lifespan.sql)


## Schema conventions


### General standardizations

Use industry standard schemas such as the Schema.org project.

  * For example, a postal address has a field for "locality", not "city".

Use International System of Units (SI), such as the metric system.

  * For example, the field name "height" is intended to use a unit of a meter, not a unit of a foot as in the Imperial system and United States customary system.


### Date and time standardization

Use date formats and time formats that are consistent with ISO standard formats.

  * For example, the timestamp display format is Year-Month-Day and Hour:Minute:Second and "Z" i.e. Zulu time zone, such as "YYYY-MM-DDTHH:MM:SSZ"

Any date or time field must be in UTC, unless the filed is deliberately representing local time, in which case the field name must use the suffix "_local" because this helps with disambiguation.

  * For example, the "person" table has the field name "birth_date_local" because we care about the person's local date birthday, not Zulu date birthday.

If you are using PostgreSQL, then you may want to change the "timestamp" data type to the PostgreSQL extension "timestamptz" data type.

  * For example, the "event" table has the entry "start_when timestamp"; if you are using PostgreSQL, you probably want to change this field to "start_when timestamptz" for Zulu time, or "start_when_local timestamp" for local time.
  

### Our data naming conventions

Use a table name that is singular, not plural.

  * For example, the examples have a "person" table, not "persons" nor "people".

Use lowercase SQL, rather than uppercase SQL. 

  * For example, the examples use "create table", not "CREATE TABLE".

Use a language code suffix when a text field could be different in different languages.

  * For example, a person's name in English is "Amy" and in French is "Aimée", so use fields "name_as_en" and "name_as_fr".

If a field can be a relation and/or freeform text, use two fields, one with field name suffix "_id" and one with field name suffix "_ie" meaning "I.e., in other words".

  * For example, a field name "status_id" is intended to be a relation to the "status" table, and a field name "status_ie" is intended to be freeform text that user can enter.

Use some of our notable exceptions because they are better at scale.

  * For example, for range naming we use "start" and "stop", not "begin" and "end", nor "from" and "to".


### Types

Use typical data type default sizes.

  * For example, we use the data type "varchar" as a default, when we don't know a text field will be somewhat short.

Use numeric data type with a large range, rather than float data type, because we prefer consistency over fluidity.

  * For example, we prefer numeric(20,12) as a general-purpose number type; you can change these as you like.

Use the word "numeric" instead of "decimal" because its clearer, such as for integrations.

  * For example, we prefer numeric(x,y) over decimal(x,y).


### Optimizations

Fast speed is more important than space, so we prefer some denormalization.

  * For example, some tables duplicate the field name "postal_code", because many of our apps use it to speed up local search.

Handling corner cases well is more important than space.

  * For example, the concepts of a "region" and "country_subdivision" are nearly identical, but not quite, so we store both.

Providing usable represenations is more important than space.

  * For example, the table "person" and table "organization" both have a field name "vcard" that stores the VCard VCF text, and a field name "hcard" that stoare the VCard as an HCard HTML microformat.


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
proofed_at timestamp, proofed_by uuid references user,
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


## Liquibase annotation

Liquibase is an open source tool for managing database schema changes.

See https://en.wikipedia.org/wiki/Liquibase

Our projects use database schema changes within source code, and within large projects, so we have schema examples here to help new projects.


### Why we use Liquibase SQL vs. XML vs. YAML

Liquibase files can be written in SQL, or XML, or YAML. We prefer SQL because more database administrators know it.

If you prefer XML or YAML and would like to translate our examples, then we welcome the help and also welcome pull requests.


## Languages

We prefer to work with multiple languages. For example, we often use English, Spanish, Chinese, and many other languages.

We use a naming convention of "{field}_as_{language}" such as "name_as_en" that means "the name as English", "name_as_es"

For the example files here, we list English and Spanish, so you can see how multiple languages can work.

You can add more languages if you want.

Some developers prefer different ways of handling languages, naming, internationalization, and localization. You can customize the files as you like for your goals.


## Tracking

* Package: sixarm_sql_schema_examples
* Version: 8.1.2
* Created: 1996-01-01
* Updated: 2019-05-16
* License: BSD, MIT, GPL
* Contact: Joel Parker Henderson (http://joelparkerhenderson.com)
