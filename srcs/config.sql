CREATE DATABASE user_database;
GRANT ALL ON user_database.* TO 'user'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
