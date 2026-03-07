-- Q1: Did campaigns attract customers to purchase products?

SELECT
    campaign_id,
    message_type,
    COUNT(*) AS total_messages,
    SUM(CASE WHEN is_purchased = true THEN 1 ELSE 0 END) AS purchases,
    ROUND(
        SUM(CASE WHEN is_purchased = true THEN 1 ELSE 0 END)::numeric
        / COUNT(*) * 100,
        2
    ) AS conversion_rate_percent
FROM messages
GROUP BY campaign_id, message_type
ORDER BY conversion_rate_percent DESC;
