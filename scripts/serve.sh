#!/bin/sh
set -e
set -x


# Create container
docker rm -f cochrane-postgres || echo
docker run --name cochrane-postgres \
    -e POSTGRES_PASSWORD='' -p 15431:5432 -d postgres
sleep 15
