# opentrials-cochrane-schizophrenia-data

Cleaned data from the Cochrane schizophrenia database

## Prerequisites

- zip, mdbtools
- Docker, psql, pgAdmin (opt)

## Convert mdb to sql

```bash
bash scripts/convert.sh
```

## Run the local database

```bash
bash scripts/serve.sh
```

Postgres database `postgres` will be available at `localhost:15431` for user `postgres` with no password. To start psql shell:

```bash
psql -p 15431 -h localhost -U postgres postgres
```

## Import/Export dirty/clean databases

See `scripts/<dirty/clean>`
