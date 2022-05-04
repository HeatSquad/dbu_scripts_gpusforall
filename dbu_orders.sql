CREATE TABLE orders
(
    orderid 		    VARCHAR(64)		NOT NULL,
    productid		    VARCHAR(64)   NOT NULL,
    userid		      VARCHAR(64)		NOT NULL,
    status		      VARCHAR(64)		NOT NULL DEFAULT 'waiting',
    quantity        INT           NOT NULL,
    created		      DATETIME      NOT NULL,
    created_by      VARCHAR(64)   NOT NULL,
    modified        DATETIME      NOT NULL,
    modified_by     VARCHAR(64)   NOT NULL,
    deleted		      VARCHAR(1)    DEFAULT ‘N’,
    PRIMARY KEY (orderid)
);

ALTER TABLE orders
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE orders
ADD FOREIGN KEY (userid) REFERENCES users(userid);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_orders_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_orders_insert_trigger_1
BEFORE INSERT ON orders
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_transno_procedure_get_id('ORD', @orderid);

	SET NEW.orderid = @orderid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO orders (productid, userid, status, quantity, created_by, modified_by, deleted)
VALUES ('PRO00001', 'USR00001', 'created', 1, 'eugene', 'eugene', 'N');
