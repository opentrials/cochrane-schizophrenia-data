# opentrials-cochrane-schizophrenia-data

Cleaned data from the Cochrane schizophrenia database

## Prerequisites

- zip, mdbtools
- Docker, psql, pgAdmin (opt)

## Convert mdb to sql

```bash
bash scripts/convert.sh
```

## Deploy the database to a local container

```bash
bash scripts/deploy.sh
```

Postgres database `postgres` will be available at `localhost:15431` for user `postgres` with no password. To start psql shell:

```bash
psql -p 15431 -h localhost -U postgres postgres
```

## Dump the database to the archive

```bash
bash scripts/dump.sh
ls archive/dirty/sql/database.zip
```
