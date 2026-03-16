-- USERS
CREATE TABLE IF NOT EXISTS users (
user_id BIGINT PRIMARY KEY
);

-- PRODUCTS
CREATE TABLE IF NOT EXISTS products (
product_id BIGINT PRIMARY KEY,
category_id BIGINT,
category_code TEXT,
brand TEXT,
price NUMERIC
);

-- EVENTS
CREATE TABLE IF NOT EXISTS events (
event_id SERIAL PRIMARY KEY,
event_time TIMESTAMP,
event_type TEXT,
product_id BIGINT,
category_id BIGINT,
category_code TEXT,
brand TEXT,
price NUMERIC,
user_id BIGINT,
user_session TEXT
);

-- CAMPAIGNS
CREATE TABLE IF NOT EXISTS campaigns (
campaign_id INT,
campaign_type TEXT,
channel TEXT,
topic TEXT,
started_at TIMESTAMP,
finished_at TIMESTAMP,
total_count INT,
PRIMARY KEY (campaign_id, campaign_type)
);

-- MESSAGES
CREATE TABLE IF NOT EXISTS messages (
message_id SERIAL PRIMARY KEY,
campaign_id INT,
message_type TEXT,
channel TEXT,
client_id BIGINT,
date DATE,
sent_at TIMESTAMP,
is_opened BOOLEAN,
is_clicked BOOLEAN,
is_purchased BOOLEAN
);

-- FRIENDS
CREATE TABLE IF NOT EXISTS friends (
user_id_1 BIGINT,
user_id_2 BIGINT,
PRIMARY KEY (user_id_1, user_id_2)
);

-- CLIENT FIRST PURCHASE
CREATE TABLE IF NOT EXISTS client_first_purchase (
client_id BIGINT PRIMARY KEY,
first_purchase_date DATE
);

-- LOAD DATA

\copy events(event_time,event_type,product_id,category_id,category_code,brand,price,user_id,user_session) FROM '/data/events.csv' DELIMITER ',' CSV HEADER;

\copy campaigns(campaign_id,campaign_type,channel,topic,started_at,finished_at,total_count) FROM '/data/campaigns.csv' DELIMITER ',' CSV HEADER;

\copy messages FROM '/data/messages.csv' DELIMITER ',' CSV HEADER;

\copy friends FROM '/data/friends.csv' DELIMITER ',' CSV HEADER;

\copy client_first_purchase FROM '/data/client_first_purchase_date.csv' DELIMITER ',' CSV HEADER;
