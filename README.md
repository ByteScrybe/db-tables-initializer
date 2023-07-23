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