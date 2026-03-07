# Big Data Assignment

This repository contains the implementation, scripts, screenshots, outputs, and final report for the big data assignment.

## Structure

- `scripts/` : SQL, MongoDB, Neo4j, and Python scripts
- `screenshots/` : screenshots of execution and results
- `output/` : experimental outputs and performance results
- `report.pdf` : final report

## Dataset
The dataset should be placed in:

data/f7/

The folder must contain:

events.csv
campaigns.csv
messages.csv
friends.csv
client_first_purchase_date.csv

## Scripts

scripts/clean_data.py  
Cleans the raw CSV files.

scripts/load_data_psql.sql  
Creates PostgreSQL tables and loads data.

scripts/load_data_mongodb.js  
Loads data into MongoDB.

scripts/load_data_graph.cypher  
Loads data into Neo4j/Memgraph.

## Diagrams

screenshots/
Contains the database models for:

PostgreSQL
MongoDB
Neo4j
