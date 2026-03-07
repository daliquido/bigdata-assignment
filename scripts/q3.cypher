// Q3: Full text search on product categories

MATCH (p:Product)
WHERE toLower(p.category_code) CONTAINS "vacuum"
RETURN
    p.product_id AS product_id,
    p.category_code AS category_code,
    p.brand AS brand,
    p.price AS price
ORDER BY price DESC
LIMIT 10;
