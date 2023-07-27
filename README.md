## Build Status

![Build badge](https://github.com/ByteScrybe/db-tables-initializer/actions/workflows/github-actions.yml/badge.svg)

## Liquibase Versioning Strategy

This project is a sample project to demonstrate how to use Liquibase to manage database changes. The project is a simple Spring Boot application entities, that are persisted to a database. The project uses Liquibase to manage the database changes.

### Versioning

Liquibase supports a versioning system using the changeSet tags in the changelog files. Each changeSet must have an id and author attribute which, combined, must be unique across all of your changelog files. These attributes are used by Liquibase to track which changes have been applied to the database and which have not.

However, for larger projects or teams, it's common to need more structure in the versioning and organization of changelog files. Here are some best practices:

1. **Semantic Versioning**: Use semantic versioning for your application, and mirror this versioning in your changelog files. For example, if your application is at version 2.3.1, have a corresponding db.changelog-2.3.1.xml file. You can then match the application and database states at any point in time.

2. **Master Changelog File**: Maintain a master changelog file (e.g., db.changelog-master.xml) that includes all other changelogs. The master changelog should be organized in the order that changesets should be executed. Liquibase supports the <include> tag which can be used to include other changelog files.

The project uses a versioning strategy that is based on the [Semantic Versioning](https://semver.org/) strategy. The versioning strategy is as follows:

1. The project has a master changelog file called `db.changelog-master.xml`. This file includes all other changelog files. The master changelog file is organized in the order that changesets should be executed.
2. Each changelog file is named `db.changelog-<major>.<minor>.<patch>.xml`. For example, `db.changelog-1.0.0.xml`. The changelog file name is based on the version of the application. The version of the application is defined in the `pom.xml` file.
3. Each changelog file has a changeset with an id and author attribute. The id and author attribute are used by Liquibase to track which changes have been applied to the database and which have not.
4. Each changeset has a comment that describes the changeset.

### Liquibase Tables

When Liquibase is run for the first time against a database, it creates two tables that it uses to track changes. The tables are: `DATABASECHANGELOG` and `DATABASECHANGELOGLOCK`. The names are configurable. A detailed description of the tables and their fields are as follows - 

1. **DATABASECHANGELOGLOCK**: This table is used to prevent multiple instances of Liquibase from executing concurrently on the same database. The table contains a single row and four columns, ID, LOCKED, LOCKGRANTED and LOCKEDBY. The ID is always 1, and the LOCKED column is a boolean (true or false) representing whether the database is currently locked. When Liquibase starts executing changes, it first locks the database by setting LOCKED to true. When it finishes, it unlocks the database by setting LOCKED back to false.
2. **DATABASECHANGELOG**: This table contains a record of all the changesets that have been run against the database. Each changeset corresponds to a row in the table. Here are the key columns in this table:

   - **ID**: The ID of the changeset.
   - **AUTHOR**: The author of the changeset.
   - **FILENAME**: The file that contains the changeset.
   - **DATEEXECUTED**: The date and time when the changeset was executed.
   - **ORDEREXECUTED**: The order in which the changeset was executed relative to other changesets.
   - **EXECTYPE**: How the changeset was executed. Possible values include EXECUTED (the changeset was executed normally), FAILED (the changeset failed to execute), SKIPPED (the changeset was skipped), etc.
   - **MD5SUM**: A checksum of the changeset used to detect whether the changeset has changed since it was run.
   - **DESCRIPTION**: A textual description of the changeset.
   - **COMMENTS**: Any comments provided with the changeset.
   - **TAG**: A tag applied to the changeset (if any).
   - **LIQUIBASE**: The version of Liquibase that executed the changeset.
