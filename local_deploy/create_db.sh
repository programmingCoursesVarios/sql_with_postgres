#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: ${DB_NAME}"

$POSTGRES <<EOSQL
CREATE DATABASE ${DB_NAME} OWNER ${POSTGRES_USER};
EOSQL

echo "Creating schema and load data from PostgreSQL custom database dump file..."
pg_restore -d ${DB_NAME} /code/mibanquito -c -U ${POSTGRES_USER}

