# SixArm » SQL » Schema examples

* [Schema example files](#schema-example-files)
* [Schema conventions](#schema-conventions)
* [Bonus fields for growth](#bonus-fields-for-growth)
* [Liquibase introduction](#liquibase-introduction)
* [Why we use Liquibase SQL vs. XML vs. YAML](#why-we-use-liquibase-sql-xml-yaml)
* [Tracking](#tracking)


<h2><a name="schema-example-files">Schema example files</a></h2>

Most popular:
  * [person.sql](person.sql)
  * [place.sql](place.sql)
  * [thing.sql](thing.sql)
  * [event.sql](event.sql)
  * [action.sql](action.sql)
  * [tag.sql](tag.sql)
  * [color.sql](color.sql)

Organization:
  * [organization.sql](organization.sql)
  * [organization__person.sql](organization__person.sql)

Access control:
  * [access_role.sql](access_role.sql)
  * [access_assigment.sql](access_assignment.sql)
  * [access_operation.sql](access_operation.sql)
  * [access_permission.sql](access_permission.sql)

Geography:
  * [geolocation.sql](geolocation.sql)
  * [country.sql](country.sql)
  * [country_subdivision.sql](country_subdivision.sql)
  * [neighborhood.sql](neighborhood.sql)

Postal:
  * [postal_address.sql](postal_address.sql)
  * [postal_code.sql](postal_code.sql)
  * [postal_locality.sql](postal_locality.sql)
  * [postal_region.sql](postal_region.sql)

Business:
  * [brand.sql](brand.sql)
  * [product.sql](product.sql)
  * [service.sql](service.sql)
  * [offer.sql](offer.sql)
  * [market_area.sql](market_area.sql)
  * [market_sector.sql](market_sector.sql)

Network:
  * [email_pop_account.sql](email_pop_account.sql)
  * [ftp_account.sql](ftp_account.sql)

Misc:
  * [rag.sql](rag.sql)
  * [imagemagick_filter.sql](imagemagick_filter.sql)
  * [lifespan.sql](lifespan.sql)

Joins:
  * [brand__market_sector.sql](brand__sector.sql)
  * [brand__organization.sql](brand__organization.sql)
  * [place__event.sql](place__event.sql)
  * [person__event.sql](person__event.sql)


<h2><a name="schema-conventions">Schema conventions</a></h2>

Our examples aim to be consistent with industry standard schemas, such as the Schema.org project.

  * For example, a postal address has "region" field, not "state" nor "province".

Use scientific measurement units.

  * For example, a "height" field uses meters, not feet nor inches.

Use a table name that is singular, not plural.

  * For example, the examples have a "person" table, not "persons" nor "people".

If a text field could be different in different languages, then append the language code.

  * For example, a person's name can use English "Amy" and French "Aimée", so use fields "name_en" and "name_fr".

If a field can be a relation or freeform text, use two fields, one with suffix "_id" and one with suffix "_ie" meaning "I.e., in other words".

  * For example, a "status_id" field is a relation to the "status" table, and a "status_ie" field is freeform text a user can type.

Use denormalization if it's likely to speed up typical usage.

  * For example, some tables duplicate the "postal_code" field because many of our apps use it to speed up local search.

Dates and times use ISO standard formatting and time zones.

  * For example, the format is Year-Month-Day and Hour:Minute:Second and Zulu time zone, such as "YYYY-MM-DDTHH:MM:SSZ".

Any date or time that must be local must use the "_local" suffix.

  * For example, the "person" table has the "birth_date_local" field because we care about the person's local date birthday, not Zulu date birthday.

Handling corner cases well is more important than saving data space:

  * For example, the concepts of a "postal_region" and "country_subdivision" are nearly identical, but not quite, so we store both.

Use typical data type default sizes.

  * For example, we use the data type "varchar(255)" as a default when we don't know a text field will be somewhat short.


<h2><a name="bonus-fields-for-growth">Bonus fields for growth</a></h2>


In practice we often add some bonus fields to each table; these fields help us with the growth of the app, and also the administration of the app.

Examples:

    zid char(36),           -- A secure random hexadecimal lowercase string,
                            -- useful for logging and distributed applications.

    lock_version int,       -- An incrementing number that an application can
                            -- use for optimistic locking for read/write speed

    created_by int,         -- Track who is managing this record and when,
    created_on datetime,    -- because this information is handy in practice
    updated_by int,         -- for diagnosing the applicaiton when it runs;
    updated_on datetime,    -- these fields can also be handy in practice
    deleted_by int,         -- for building apps that synchronize data
    deleted_on datetime,    -- or use eventually-consistent databases.

    type varchar(255)       -- The "type" is a reserved word in some frameworks,
    typed int               -- which uses the field for single-table inheritance.

    position int            -- For a record that has a specific position within a list

    parent_id int           -- For a record that has a direct parent record

    status_id int,          -- Typically relates to a status table suitable for the app
    status_ie varchar(255), -- Typically freeform text entered by a user 

    url text,               -- Typically a URL to more information about this record
    note longtext,          -- Typically freeform text entered by a user


<h2><a name="liquibase-introduction">Liquibase introduction</a></h2>

Liquibase is an open source tool for managing database schema changes.

See https://en.wikipedia.org/wiki/Liquibase

Our projects use database schema changes within source code, and within large projects, so we have schema examples here to help new projects.


<h2><a name="why-we-use-liquibase-sql-xml-yaml">Why we use Liquibase SQL vs. XML vs. YAML</a></h2>

Liquibase files can be written in SQL, or XML, or YAML. We prefer SQL because more database administrators know it.

If you prefer XML or YAML and would like to translate our examples, then we welcome the help and also welcome pull requests.


<h2><a name="tracking">Tracking</a></h2>

* Package: sixarm_sql_schema_examples
* Version: 5.0.0
* Created: 1996-01-01
* Updated: 2016-10-30
* License: BSD, MIT, GPL
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
