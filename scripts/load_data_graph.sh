#!/bin/sh

echo "Loading graph database..."

cypher-shell -f scripts/load_data_graph.cypher

echo "Graph database loading completed."
