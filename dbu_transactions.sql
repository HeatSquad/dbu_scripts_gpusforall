CREATE TABLE transactions
(
    transactionid	VARCHAR(64)	NOT NULL,
    orderid		    VARCHAR(64)	NOT NULL,
    userid		    VARCHAR(64)	NOT NULL,
    status		    VARCHAR(64)	NOT NULL DEFAULT 'waiting',
    subtotal        INT,       
    grand_total     INT,        
    applied_tax_percent INT,     
    discount        INT,         
    json_billing    JSON,            
    json_shipping   JSON,            
    created		    DATETIME	NOT NULL,
    created_by      VARCHAR(64)	NOT NULL,
    modified		DATETIME	NOT NULL,
    modified_by	    VARCHAR(64)	NOT NULL,
    deleted		    VARCHAR(1)	DEFAULT 'N',
    PRIMARY KEY (orderid)
);

ALTER TABLE shoppingcart
ADD FOREIGN KEY (userid) REFERENCES users(userid);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_transactions_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_transactions_insert_trigger_1
BEFORE INSERT ON transactions
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_trans_no_procedure_get_id('TRA', @transactionid);

	SET NEW.transactionid = @transactionid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.transactions (orderid, userid, status, subtotal, grand_total, applied_tax_percent, discount, json_billing, json_shipping, created_by, modified_by, deleted)
VALUES ('ORD00001', 'USR00001', '', 1000, 10000, 9, 100, '{}', '{}', 'eugene', 'eugene', 'N');
