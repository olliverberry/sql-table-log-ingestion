#!/bin/bash

DBSTATUS=1
ERRCODE=1
i=0

while [[ $DBSTATUS -ne 0 ]] && [[ $i -lt 60 ]] && [[ $ERRCODE -ne 0 ]]; do
	i=$i+1
	DBSTATUS=$(sqlcmd -h -1 -t 1 -U sa -P $SA_PASSWORD -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases")
	ERRCODE=$?
	sleep 1
done

if [ $DBSTATUS -ne 0 ] OR [ $ERRCODE -ne 0 ]; then 
	echo "SQL Server took more than 60 seconds to start up or one or more databases are not in an ONLINE state"
	exit 1
fi

# Run the setup script to create the DB and the schema in the DB
sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i setup.sql

# Run script to add new rows to table
while true; do
	sqlcmd \
		-S localhost \
		-U sa \
		-P $SA_PASSWORD \
		-d $DB_NAME \
		-Q "INSERT INTO $TABLE_NAME VALUES (GETUTCDATE(), \"this is a log message\", \"debug\")"
	sleep 10
done