# SixArm » Liquibase » Schema examples

* [Liquibase introduction](#liquibase-introduction)
* [Schema example files](#schema-example-files)
* [Source code](#source-code)
* [Schema conventions](#schema-conventions)
* [Why use SQL vs. XML vs. YAML](#why-use-sql-xml-yaml)
* [Bonus fields for growth](#bonus-fields-for-growth)


<h2><a name="liquibase-introduction">Liquibase introduction</a></h2>

Liquibase is an open source tool for managing database schema changes.

See https://en.wikipedia.org/wiki/Liquibase

Our projects use database schema changes within source code, and within large projects, so we have schema examples here to help new projects.


<h2><a name="schema-example-files">Schema example files</a></h2>

Schema example files in order of popularity:
* Most popular
  * [person](person.sql)
  * [place](place.sql)
  * [thing](thing.sql)
  * [tag](tag.sql)
  * [color](color.sql)
* Organization
  * [organization](organization.sql)
  * [organization__person](organization__person.sql)
* Access control
  * [access_role](access_role.sql)
  * [access_assigment](access_assignment.sql)
  * [access_operation](access_operation.sql)
  * [access_permission](access_permission.sql)
* Geography
  * [geolocation](geolocation.sql)
  * [country](country.sql)
  * [country_subdivision](country_subdivision.sql)
  * [neighborhood](neighborhood.sql)
* Postal mail
  * [postal_address](postal_address.sql)
  * [postal_code](postal_code.sql) a.k.a. ZIP code
  * [postal_locality](postal_locality.sql) a.k.a. city
  * [postal_region](postal_region.sql) a.k.a. state or province
* Brand
  * [brand](brand.sql)
  * [brand__market_sector](brand__sector.sql)
  * [brand__organization](brand__organization.sql)
* Market
  * [market_area](market_area.sql)
  * [market_sector](market_sector.sql)
* Network
  * [email_pop_account](email_pop_account.sql)
  * [ftp_account](ftp_account.sql)
* Other
  * [rag](rag.sql)
  * [imagemagick_filter](imagemagick_filter.sql)
  * [lifespan](lifespan.sql)


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


<h2><a name="why-use-sql-xml-yaml">Why use SQL vs. XML vs. YAML?</a></h2>

Liquibase files can be written in SQL, or XML, or YAML. We prefer SQL because more database administrators know it.

If you prefer XML or YAML and would like to translate our examples, then we welcome the help and also welcome pull requests.


## Bonus fields for growth

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

    uri text,               -- Typically a URL to more information about this record
    note longtext,          -- Typically freeform text entered by a user
