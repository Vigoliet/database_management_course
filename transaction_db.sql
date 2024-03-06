CREATE DATABASE transaction_db;

USE transaction_db;

CREATE TABLE persons(
	person_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE accounts(
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    account_number VARCHAR(255) NOT NULL,
    balance INT UNSIGNED DEFAULT 0,
    FOREIGN KEY (person_id) REFERENCES persons(person_id)
);



