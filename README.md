# opentrials-cochrane-schizophrenia-data

Cleaned data from the Cochrane schizophrenia database

## Prerequisites

- zip, mdbtools
- Docker, psql, pgAdmin (opt)

## Run local postgres server

```bash
bash scripts/serve.sh
```

Postgres database `postgres` will be available at `localhost:15431` for user `postgres` with no password. To start psql shell:

```bash
psql -p 15431 -h localhost -U postgres postgres
```

## Convert the dirty database (mdb2sql)

```bash
bash scripts/dirty/convert.sh
```

## Import/Export the dirty databases

```bash
bash scripts/dirty/import.sh
bash scripts/dirty/export.sh
```

Artifacts will be in the `archive/dirty` dir.
For example sql dump - `archive/dirty/sql/database.zip`

## Import/Export the clean databases

```bash
bash scripts/clean/import.sh
bash scripts/clean/export.sh
```

Artifacts will be in the `archive/clean` dir.
For example sql dump - `archive/dirty/sql/database.sql`

## Convert the dirty database (sql2csv)

```bash
bash scripts/clean/convert.sh
```
*under development*
