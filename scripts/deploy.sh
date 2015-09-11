#!/bin/sh
set -e
set -x


# Import dump
psql -p 15431 -h localhost -U postgres -f archive/clean/sql/database.sql postgres
