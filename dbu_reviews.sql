CREATE TABLE reviews 
(
    reviewid 		VARCHAR(64)		NOT NULL,
    productid		VARCHAR(64)		NOT NULL,
    userid		    VARCHAR(64)		NOT NULL,
    text		    VARCHAR(4000),
    created		    DATETIME        NOT NULL,
    created_by	    VARCHAR(64)     NOT NULL,
    modified		DATETIME        NOT NULL,
    modified_by	    VARCHAR(64)     NOT NULL,
    deleted 		VARCHAR(1)		DEFAULT 'N',
    PRIMARY KEY (reviewid)
);

ALTER TABLE reviews
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE reviews
ADD FOREIGN KEY (userid) REFERENCES users(userid);

-- ========================================================
-- Triggers
-- ========================================================

DROP TRIGGER sys_reviews_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_reviews_insert_trigger_1
BEFORE INSERT ON reviews
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_trans_no_procedure_get_id('REV', @reviewid);

	SET NEW.reviewid = @reviewid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.reviews (productid, userid, text, created_by, modified_by, deleted)
VALUES ('PRO00001', 'USR00001', 'This GPU sucks!','eugene', 'eugene', 'N');