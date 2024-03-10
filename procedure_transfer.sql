DELIMITER //

CREATE PROCEDURE transfer(
    IN sender_id INT,
    IN receiver_id INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Insufficient funds';
    DECLARE commit_message VARCHAR(255) DEFAULT 'Transaction committed successfully';

    -- Start the transaction
    START TRANSACTION;

    -- Attempt to debit money from account 1
    UPDATE accounts SET balance = balance - amount WHERE account_id = sender_id;

    -- Attempt to credit money to account 2
    UPDATE accounts SET balance = balance + amount WHERE account_id = receiver_id;

    -- Check if there are sufficient funds in account 1
    -- Simulate a condition where there are insufficient funds
    IF (SELECT balance FROM accounts WHERE account_id = sender_id) < 0 THEN
        -- Roll back the transaction if there are insufficient funds
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = rollback_message;
    ELSE
        -- Log the transactions if there are sufficient funds
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (sender_id, -amount, 'WITHDRAWAL');
        INSERT INTO transactions (account_id, amount, transaction_type) VALUES (receiver_id, amount, 'DEPOSIT');
        
        -- Commit the transaction
        COMMIT;
        SELECT commit_message AS 'Result';
    END IF;
END //

DELIMITER ;