// Q1: Did campaigns attract customers to purchase products?

MATCH (c:Campaign)-[:SENT]->(m:Message)
WITH c.campaign_id AS campaign_id,
     count(m) AS total_messages,
     sum(CASE WHEN m.is_purchased = true THEN 1 ELSE 0 END) AS purchases
RETURN
    campaign_id,
    total_messages,
    purchases,
    (purchases * 100.0 / total_messages) AS conversion_rate_percent
ORDER BY conversion_rate_percent DESC;
