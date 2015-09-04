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
