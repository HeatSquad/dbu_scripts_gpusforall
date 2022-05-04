CREATE TABLE products
(
    productid	    VARCHAR(64)	    NOT NULL,
    product_name	VARCHAR(256)	NOT NULL,
    price		    FLOAT	        NOT NULL,
    description	    VARCHAR(4000),
    inventory		INT	            DEFAULT 0,
    manufacturer	VARCHAR(256),
    model		    VARCHAR(256),
    memory_size	    VARCHAR(64),
    memory_type	    VARCHAR(64),
    chip_manufacturer	VARCHAR(64),
    created		    DATETIME,
    created_by	    VARCHAR(64),
    modified		DATETIME,
    modified_by	    VARCHAR(64),
    deleted 		VARCHAR(1)	    DEFAULT 'N',
    PRIMARY KEY (productid)
);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_products_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_products_insert_trigger_1
BEFORE INSERT ON products
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_transno_procedure_get_id('PRO', @productid);

	SET NEW.productid = @productid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.products (product_name, price, description, inventory, manufacturer, model, memory_size, memory_type, chip_manufacturer, created_by, modified_by, deleted)
VALUES ('AMD MI100,300W PCIe, 32GB Passive, Double Wide, GPU Customer Install', 9819.14, 'The era of exascale is here. Immense computational power coupled with the fusion of HPC and AI is enabling researchers to tackle grand challenges once thought beyond reach.', 100, 'AMD', 'MI100', '32GB', 'Passive', 'Advanced Micro Devices', 'eugene', 'eugene', 'N');
