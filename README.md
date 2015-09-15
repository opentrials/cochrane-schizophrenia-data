# opentrials-cochrane-schizophrenia-data

Cleaned data from the Cochrane schizophrenia database.
High-level data model and migration process overview - [OVERVIEW.md](https://github.com/okfn/opentrials-cochrane-schizophrenia-data/blob/master/README.md)

## Prerequisites

- zip, mdbtools
- Docker, psql, pgAdmin (opt)

## Clean database dump

```
archive/clean/sql/database.sql
```

## Quick start to get up and running

To run local Postgres server with the clean database:

```bash
bash scripts/serve.sh && bash scripts/deploy.sh
```

Postgres database `postgres` will be available at `localhost:15431` for user `postgres` with no password. To start psql shell:

```bash
psql -p 15431 -h localhost -U postgres postgres
```

## Conversion process

### Run local postgres server

```bash
bash scripts/serve.sh
```

### Convert the dirty database (mdb2sql)

```bash
bash scripts/dirty/convert.sh
```

### Import/Export the dirty databases

```bash
bash scripts/dirty/import.sh
bash scripts/dirty/export.sh
```

Artifacts will be in the `archive/dirty` dir.
For example sql dump - `archive/dirty/sql/database.zip`

### Import/Export the clean databases

```bash
bash scripts/clean/import.sh
bash scripts/clean/export.sh
```

Artifacts will be in the `archive/clean` dir.
For example sql dump - `archive/clean/sql/database.sql`

### Convert the clean database (sql2csv)

```bash
bash scripts/clean/convert.sh
```
*under development*
