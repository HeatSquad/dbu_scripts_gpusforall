CREATE TABLE wishlist 
(
    wishlistid	    VARCHAR(64)	NOT NULL,
    productid		VARCHAR(64)	NOT NULL,
    userid		    VARCHAR(64)	NOT NULL,
    quantity		INT		        NOT NULL,
    created		    DATETIME	    NOT NULL,
    created_by	    VARCHAR(64)	NOT NULL,
    modified		DATETIME	    NOT NULL,
    modified_by	    VARCHAR(64)	NOT NULL,
    deleted		    VARCHAR(1)	    DEFAULT 'N',
    PRIMARY KEY (wishlistid)
);

ALTER TABLE wishlist
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE wishlist
ADD FOREIGN KEY (userid) REFERENCES users(userid);