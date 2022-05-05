CREATE TABLE wish_list 
(
    wishlistid	    VARCHAR(64)	NOT NULL,
    productid		VARCHAR(64)	NOT NULL,
    userid		    VARCHAR(64)	NOT NULL,
    quantity		INT		    NOT NULL,
    created		    DATETIME	NOT NULL,
    created_by	    VARCHAR(64)	NOT NULL,
    modified		DATETIME	NOT NULL,
    modified_by	    VARCHAR(64)	NOT NULL,
    deleted		    VARCHAR(1)	DEFAULT 'N',
    PRIMARY KEY (wishlistid)
);

ALTER TABLE wish_list
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE wish_list
ADD FOREIGN KEY (userid) REFERENCES users(userid);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_wish_list_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_wish_list_insert_trigger_1
BEFORE INSERT ON wish_list
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_trans_no_procedure_get_id('WSH', @wishlistid);

	SET NEW.wishlistid = @wishlistid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.wish_list (productid, userid, quantity, created_by, modified_by, deleted)
VALUES ('PRO00001', 'USR00001', 100, 'eugene', 'eugene', 'N');
