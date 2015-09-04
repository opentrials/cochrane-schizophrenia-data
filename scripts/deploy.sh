#!/bin/sh
set -e
set -x


# Create container
docker rm -f cochrane-postgres || echo
docker run --name cochrane-postgres \
    -e POSTGRES_PASSWORD='' -p 15431:5432 -d postgres
sleep 15

# Import database scheme
psql -p 15431 -h localhost -U postgres -f archive/dirty/sql/schema.sql postgres

# Import database data
for sqlfile in $(ls archive/dirty/sql/tbl*); do
    psql -p 15431 -h localhost -U postgres -f "${sqlfile}" postgres
done

# Import database foreign keys
psql -p 15431 -h localhost -U postgres -f archive/dirty/sql/foreignkeys.sql postgres

# Dump database to archive
tempfile=$(tempfile)
zipfile="archive/dirty/sql/database.zip"
rm -f "${zipfile}"
pg_dump -p 15431 -h localhost -U postgres postgres > "${tempfile}"
zip -j "${zipfile}" "${tempfile}"
printf "@ ${tempfile##*/}\n@=database.sql\n" | zipnote -w "${zipfile}"
rm -f "${tempfile}"
