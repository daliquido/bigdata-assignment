#!/bin/sh

echo "Loading PostgreSQL database..."

psql -U postgres -f scripts/load_data_psql.sql

echo "Database loading completed."
