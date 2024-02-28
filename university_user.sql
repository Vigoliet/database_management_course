CREATE USER 'university_user'@'localhost' IDENTIFIED BY 'university_pass';
GRANT ALL PRIVILEGES ON university.* TO 'university_user'@'localhost';
FLUSH PRIVILEGES;