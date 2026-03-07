-- Q3: Full text search on product categories

SELECT
    product_id,
    category_code,
    brand,
    price
FROM products
WHERE category_code ILIKE '%vacuum%'
ORDER BY price DESC
LIMIT 10;
