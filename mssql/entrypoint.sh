#!/bin/bash

# add tools to path for conveniance
export PATH="$PATH":/opt/mssql-tools/bin

# Start the script to create the DB and user
/usr/config/configure-db.sh &

# Start SQL Server
/opt/mssql/bin/sqlservr