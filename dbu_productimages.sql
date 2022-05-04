CREATE TABLE product_images
(
    imageid		VARCHAR(64)    NOT NULL,
    productid	VARCHAR(64)	   NOT NULL,
    image_path	VARCHAR(128),   
    created		DATETIME,        
    created_by	VARCHAR(64)   NOT NULL, 
    modified	DATETIME      NOT NULL,  
    modified_by	VARCHAR(64)   NOT NULL, 
    deleted 	VARCHAR(1)	  DEFAULT 'N'
)

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_product_images_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_product_images_insert_trigger_1
BEFORE INSERT ON product_images
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_transno_procedure_get_id('IMG', @imageid);

	SET NEW.imageid = @imageid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.product_images (productid, image_path, created_by, modified_by, deleted)
VALUES ('PRO00001', '/images/PRO00001', 'eugene', 'eugene', 'N');