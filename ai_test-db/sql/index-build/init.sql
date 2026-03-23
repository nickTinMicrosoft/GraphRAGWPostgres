CREATE DATABASE ai_test;

CREATE ROLE db_user WITH LOGIN PASSWORD 'your_password'; -- Replace 'your_password' with a secure password for the db_user
GRANT ALL PRIVILEGES ON DATABASE ai_test TO db_user;