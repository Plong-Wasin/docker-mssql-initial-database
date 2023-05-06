# Example docker compose Microsoft SQL Server with initial database

This is an example of how to use docker compose to create a Microsoft SQL Server container with an initial database.

This script will create a database called `test` and create database from MSSQL_DB environment variable.

### Credits

-   [Create database with declare variable](https://stackoverflow.com/a/3397931)
-   [Startup script](https://github.com/microsoft/mssql-docker/issues/11#issuecomment-452272205)
-   [Wait for SQL Server to start script](https://github.com/microsoft/mssql-docker/issues/2#issuecomment-1340624666)
