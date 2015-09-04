# opentrials-cochrane-schizophrenia-data

Cleaned data from the Cochrane schizophrenia database

## Prerequisites

- zip, mdbtools
- Docker, psql, pgAdmin (opt)

## Convert mdb to sql

```bash
bash scripts/convert.sh
```

## Deploy database to local container

```bash
bash scripts/deploy.sh
```

## Dirty database sql dump location

```bash
archive/dirty/sql/database.zip
```

Postgres database `postgres` will be available at `localhost:15431` for user `postgres` with no password. To start psql shell:

```bash
psql -p 15431 -h localhost -U postgres postgres
