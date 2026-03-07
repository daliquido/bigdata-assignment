-- Q2: Find top recommended products based on user interactions

SELECT
    product_id,
    COUNT(*) AS interaction_count
FROM events
GROUP BY product_id
ORDER BY interaction_count DESC
LIMIT 10;
