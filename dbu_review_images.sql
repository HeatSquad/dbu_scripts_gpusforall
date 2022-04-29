CREATE TABLE review_images
(
    imageid		    VARCHAR(64)     NOT NULL,
    reviewid		VARCHAR(64)	    NOT NULL,
    image   	    BLOB            NOT NULL,
    created		    DATETIME        NOT NULL,
    created_by	    VARCHAR(64)     NOT NULL,
    modified		DATETIME        NOT NULL,
    modified_by	    VARCHAR(64)     NOT NULL,
    deleted 		VARCHAR(1)	    DEFAULT 'N',
    PRIMARY KEY (imageid)
);

ALTER TABLE review_images
ADD FOREIGN KEY (reviewid) REFERENCES reviews(reviewid);