This project is to show that it's possible to collect logs, which have been stored in a SQL table, and send them
to Datadog. The components of the prototype are the following:
1. logstash container
2. mssql container

The logstash container configures a logstash pipeline using Microsoft's JDBC driver. It also configures Datadog's
logstash output plugin.

The mssql container configures Microsoft SQL Server and runs a script to add new rows to a table every 10 seconds.

To run this project, clone the repository and create a .env file in the root directory. The following varibles need to be
populated:
1. DD_API_KEY -- your Datadog API key
2. ACCEPT_EULA -- needed for the mssql container
3. SA_PASSWORD -- the password for the 'sa' SQL Server user
4. DB_NAME -- the name of the database in SQL Server to add the logs table to
5. LOGIN_NAME -- the name of the login that logstash will use to login to SQL with
6. USER_NAME -- the name of the user that corresponds with the login
7. USER_PASSWORD -- the user's password that logstash will use to login to SQL with
8. TABLE_NAME -- the name of the table where new logs will be written