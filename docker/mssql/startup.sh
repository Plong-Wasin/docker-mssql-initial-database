#!/bin/bash
# Launch MSSQL and send to background
/opt/mssql/bin/sqlservr &
# check first if there are files in the directory
if [ $(ls -1 /var/opt/mssql/ | wc -l) -eq 0 ]; then
    rows_affected=0
    while [[ rows_affected -lt 4 ]]; do
        echo "Waiting for sys.databases query to return 4 or more rows"
        sleep 1
        rows_affected=$(/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P "$SA_PASSWORD" -Q 'SELECT name FROM sys.databases' 2>/dev/null | sed -n 's/(//; s/ rows affected.*//p;')
    done

    if [ -d /docker-entrypoint-initdb.d/ ]; then
        for foo in /docker-entrypoint-initdb.d/*.sql; do
            /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -l 30 -e -i $foo
        done
    fi
fi
# Wait until MSSQL is ready

# So that the container doesn't shut down, sleep this thread
sleep infinity
