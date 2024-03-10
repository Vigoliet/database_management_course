CREATE DATABASE banks;

USE banks;

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT  PRIMARY KEY ,
    account_holder VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);


INSERT INTO accounts (account_holder, balance) 
VALUES ('John Doe', 1000.00),
       ('Jane Doe', 500.00);
