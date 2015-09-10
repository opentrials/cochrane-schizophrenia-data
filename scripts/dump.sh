#!/bin/sh
set -e
set -x


# Dump dirty database
tempfile=$(tempfile)
zipfile="archive/dirty/sql/database.zip"
rm -f "${zipfile}"
pg_dump -p 15431 -h localhost -U postgres -n dirty postgres > "${tempfile}"
zip -j "${zipfile}" "${tempfile}"
printf "@ ${tempfile##*/}\n@=database.sql\n" | zipnote -w "${zipfile}"
rm -f "${tempfile}"


# Dump clean database
dumpfile="archive/clean/sql/clean.sql"
pg_dump -p 15431 -h localhost -U postgres -n clean postgres > "${dumpfile}"
