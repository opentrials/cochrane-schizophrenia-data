#!/bin/sh
set -e
set -x


# Export clean database
dumpfile="archive/clean/sql/database.sql"
pg_dump -p 15431 -h localhost -U postgres -n clean postgres > "${dumpfile}"
