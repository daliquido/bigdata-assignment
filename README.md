# Big Data Assignment

This repository contains the full implementation and report for a Big Data assignment focused on modeling, loading, querying, and benchmarking an e-commerce dataset using three different database paradigms:

- **PostgreSQL** for the relational model
- **MongoDB** for the document-oriented model
- **Neo4j** for the graph model

The project includes database schemas, data cleaning scripts, loading scripts, analytical queries, benchmark outputs, screenshots, and the final report.

---

## Project Objective

The goal of this assignment is to compare how different database systems handle the same analytical workload. The dataset was modeled and queried in PostgreSQL, MongoDB, and Neo4j, then benchmarked to evaluate performance differences across:

1. **Campaign effectiveness analysis**
2. **Product recommendation analysis**
3. **Product category search**

The report also discusses modeling decisions, benchmarking methodology, and the strengths and weaknesses of each database paradigm.

---

## Repository Structure

```text
bigdata-assignment/
├── scripts/
│   ├── clean_data.py
│   ├── load_data_psql.sql
│   ├── load_data_mongodb.js
│   ├── load_data_graph.cypher
│   ├── q1.sql
│   ├── q2.sql
│   ├── q3.sql
│   ├── q1.js
│   ├── q2.js
│   ├── q3.js
│   ├── q1.cypher
│   ├── q2.cypher
│   └── q3.cypher
│
├── screenshots/
│   ├── psql_model.png
│   ├── mongodb_model.png
│   ├── neo4j_model.png
│   └── query_result_screenshots...
│
├── output/
│   └── benchmarking_results...
│
├── bigdata_report.pdf
├── .gitignore
└── README.md
