CREATE TABLE reviews 
(
    reviewid 		VARCHAR(64)		NOT NULL,
    productid		VARCHAR(64)		NOT NULL,
    userid		    VARCHAR(64)		NOT NULL,
    text		    VARCHAR(4000),
    created		    DATETIME,
    created_by	    VARCHAR(64),
    modified		DATETIME,
    modified_by	    VARCHAR(64),
    deleted 		VARCHAR(1)		DEFAULT 'N',
    PRIMARY KEY (reviewid)
);

ALTER TABLE reviews
ADD FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE reviews
ADD FOREIGN KEY (userid) REFERENCES users(userid);