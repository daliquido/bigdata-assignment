// Create Users
LOAD CSV WITH HEADERS FROM 'file:///friends.csv' AS row
MERGE (u1:User {user_id: toInteger(row.user_id_1)})
MERGE (u2:User {user_id: toInteger(row.user_id_2)})
MERGE (u1)-[:FRIEND]->(u2);

// Create Events and Products
LOAD CSV WITH HEADERS FROM 'file:///events.csv' AS row
MERGE (u:User {user_id: toInteger(row.user_id)})
MERGE (p:Product {product_id: toInteger(row.product_id)})
CREATE (e:Event {
    event_time: row.event_time,
    event_type: row.event_type,
    session: row.user_session
})
MERGE (u)-[:PERFORMED]->(e)
MERGE (e)-[:ON_PRODUCT]->(p);

// Create Campaigns
LOAD CSV WITH HEADERS FROM 'file:///campaigns.csv' AS row
MERGE (c:Campaign {
    campaign_id: toInteger(row.campaign_id),
    campaign_type: row.campaign_type
});

// Create Messages
LOAD CSV WITH HEADERS FROM 'file:///messages.csv' AS row
MERGE (c:Campaign {
    campaign_id: toInteger(row.campaign_id),
    campaign_type: row.message_type
})
CREATE (m:Message {
    client_id: row.client_id,
    sent_at: row.sent_at,
    is_opened: row.is_opened,
    is_clicked: row.is_clicked,
    is_purchased: row.is_purchased
})
MERGE (c)-[:SENT]->(m);
