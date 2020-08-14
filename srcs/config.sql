CREATE DATABASE wordpress;
CREATE USER username@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO username@localhost;
FLUSH PRIVILEGES;
