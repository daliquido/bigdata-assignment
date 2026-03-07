#!/bin/sh

echo "Loading MongoDB database..."

mongosh --file scripts/load_data_mongodb.js

echo "MongoDB loading completed."
