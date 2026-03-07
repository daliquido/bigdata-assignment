// Q2: Find top recommended products based on user interactions

MATCH (:User)-[:PERFORMED]->(:Event)-[:ON_PRODUCT]->(p:Product)
RETURN
    p.product_id AS product_id,
    count(*) AS interaction_count
ORDER BY interaction_count DESC
LIMIT 10;
