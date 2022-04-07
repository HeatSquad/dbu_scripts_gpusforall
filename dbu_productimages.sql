CREATE TABLE product_images
(
    imageid		VARCHAR(64),
    productid	VARCHAR(64)	NOT NULL,
    image_path	VARCHAR(128),   
    created		DATETIME,        
    created_by	VARCHAR(64),    
    modified	DATETIME,        
    modified_by	VARCHAR(64),    
    deleted 	VARCHAR(1)	    DEFAULT 'N'
)