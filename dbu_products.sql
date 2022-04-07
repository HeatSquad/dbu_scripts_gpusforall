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
    deleted 		VARCHAR(1)	    DEFAULT 'N'
);