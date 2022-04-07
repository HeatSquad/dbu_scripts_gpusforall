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