#!/bin/sh
set -e
set -x


# Convert from sql to csv
for sqlfile in $(ls archive/clean/sql/data-*); do
    table=$(basename $sqlfile ".sql")
    table=${table:5}
    csvfile="archive/clean/csv/data/${table}.csv"
    query="\\copy \"clean\".\"${table}\" To '${csvfile}' With CSV HEADER"
    psql -p 15431 -h localhost -U postgres -d postgres -c "${query}"
done
