#!/bin/sh
set -e
set -x


# Create mdb file
mdbfile=$(tempfile)

# Create temp file
tempfile=$(tempfile)

# Unzip database archive
unzip -p archive/dirty/mdb/database.zip > "${mdbfile}"


# Create schema file
schemaname="dirty"
schemafile="archive/dirty/sql/schema.sql"
mdb-schema "${mdbfile}" postgres > "${tempfile}"
printf "BEGIN;\n" > "${schemafile}"
printf "CREATE SCHEMA IF NOT EXISTS \"${schemaname}\";\n" >> "${schemafile}"
printf "SET search_path = \"${schemaname}\", pg_catalog;\n" >> "${schemafile}"
awk '($0 !~ /(^ALTER TABLE.*FOREIGN KEY.*REFERENCES|^CREATE UNIQUE INDEX)/) {print;}' \
    "${tempfile}" >> "${schemafile}"
printf "\nEND;\n" >> "${schemafile}"


# Create foreign keys file
fkfile="archive/dirty/sql/foreignkeys.sql"
printf "BEGIN;\n" > "${fkfile}"
printf "SET search_path = \"${schemaname}\", pg_catalog;\n" >> "${fkfile}"
awk '($0 ~ /^ALTER TABLE.*FOREIGN KEY.*REFERENCES/) {print;}' "${tempfile}" \
    >> "${fkfile}"
printf "\nEND;\n" >> "${fkfile}"


# Create data files
for table in $(mdb-tables "${mdbfile}"); do
    sqlfile="archive/dirty/sql/${table}.sql"
    filepath="archive/dirty/csv/${filename}"
    printf "BEGIN;\n" > "${sqlfile}"
    printf "SET CONSTRAINTS ALL DEFERRED;\n" >> "${sqlfile}"
    printf "COPY \"${schemaname}\".\"${table}\" FROM STDIN WITH CSV HEADER;\n" >> "${sqlfile}"
    mdb-export -D '%Y-%m-%d %H:%M:%S' "${mdbfile}" "${table}" >> "${sqlfile}"
    printf "\.\n" >> "${sqlfile}"
    printf "END;\n" >> "${sqlfile}"
done


# Remove mdb file
rm -f "${mdbfile}"

# Remove temp file
rm -f "${tempfile}"
