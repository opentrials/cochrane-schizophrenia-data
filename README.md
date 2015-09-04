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

archive/dirty/sql/database.zip
