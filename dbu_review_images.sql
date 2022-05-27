CREATE TABLE review_images
(
    imageid		    VARCHAR(64)     NOT NULL,
    reviewid		VARCHAR(64)	    NOT NULL,
    image   	    LONGTEXT        NOT NULL,
    created		    DATETIME        NOT NULL,
    created_by	    VARCHAR(64)     NOT NULL,
    modified		DATETIME        NOT NULL,
    modified_by	    VARCHAR(64)     NOT NULL,
    deleted 		VARCHAR(1)	    DEFAULT 'N',
);

ALTER TABLE review_images
ADD FOREIGN KEY (reviewid) REFERENCES reviews(reviewid);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_review_images_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_review_images_insert_trigger_1
BEFORE INSERT ON review_images
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_trans_no_procedure_get_id('IMGR', @reviewimageid);

	SET NEW.imageid = @reviewimageid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.review_images (reviewid, image, created_by, modified_by, deleted)
VALUES ('REV00001', '{}', 'eugene', 'eugene', 'N');