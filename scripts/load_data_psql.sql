-- Create database
CREATE DATABASE ecommerce;

-- Connect to database
\c ecommerce;

-- USERS
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY
);

-- PRODUCTS
CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    category_id BIGINT,
    category_code TEXT,
    brand TEXT,
    price NUMERIC
);

-- EVENTS
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_time TIMESTAMP,
    event_type TEXT,
    product_id BIGINT,
    user_id BIGINT,
    user_session TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- CAMPAIGNS
CREATE TABLE campaigns (
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
CREATE TABLE messages (
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
CREATE TABLE friends (
    user_id_1 BIGINT,
    user_id_2 BIGINT,
    PRIMARY KEY (user_id_1, user_id_2),
    FOREIGN KEY (user_id_1) REFERENCES users(user_id),
    FOREIGN KEY (user_id_2) REFERENCES users(user_id)
);

-- CLIENT FIRST PURCHASE
CREATE TABLE client_first_purchase (
    client_id BIGINT PRIMARY KEY,
    first_purchase_date DATE
);

-- Load data (adjust paths depending on your machine)
COPY events(event_time, event_type, product_id, category_id, category_code, brand, price, user_id, user_session)
FROM 'data/cleaned/events.csv'
DELIMITER ','
CSV HEADER;

COPY campaigns
FROM 'data/cleaned/campaigns.csv'
DELIMITER ','
CSV HEADER;

COPY messages
FROM 'data/cleaned/messages.csv'
DELIMITER ','
CSV HEADER;

COPY friends
FROM 'data/cleaned/friends.csv'
DELIMITER ','
CSV HEADER;

COPY client_first_purchase
FROM 'data/cleaned/client_first_purchase_date.csv'
DELIMITER ','
CSV HEADER;
