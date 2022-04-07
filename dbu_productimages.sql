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