INSERT INTO users (username, email, created_at) VALUES
('user1', 'user1@example.com', NOW()),
('user2', 'user2@example.com', NOW()),
('user3', 'user3@example.com', NOW());

INSERT INTO products (name, description, price, created_at) VALUES
('Product A', 'Description for Product A', 29.99, NOW()),
('Product B', 'Description for Product B', 49.99, NOW()),
('Product C', 'Description for Product C', 19.99, NOW());

INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
(1, 1, 2, NOW()),
(1, 2, 1, NOW()),
(2, 3, 5, NOW());