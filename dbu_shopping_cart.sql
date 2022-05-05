CREATE TABLE shopping_cart
(
    cartid		VARCHAR(64)	    NOT NULL,
    productid	VARCHAR(64)	    NOT NULL,
    userid		VARCHAR(64)	    NOT NULL,
    quantity	INT		        NOT NULL,
    created		DATETIME	    NOT NULL,
    created_by	VARCHAR(64)	    NOT NULL,
    modified	DATETIME	    NOT NULL,
    modified_by	VARCHAR(64)	    NOT NULL,
    deleted		VARCHAR(1) 	    DEFAULT 'N',
    PRIMARY KEY (cartid)
);

ALTER TABLE shopping_cart
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE shopping_cart
ADD FOREIGN KEY (userid) REFERENCES users(userid);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_shopping_cart_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_shopping_cart_insert_trigger_1
BEFORE INSERT ON shopping_cart
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_trans_no_procedure_get_id('CAR', @cartid);

	SET NEW.cartid = @cartid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.shopping_cart (productid, userid, quantity, created_by, modified_by, deleted)
VALUES ('PRO00001', 'USR00001', 200, 'eugene', 'eugene', 'N');