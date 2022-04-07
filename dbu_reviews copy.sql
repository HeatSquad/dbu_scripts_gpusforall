CREATE TABLE review_images
(
    imageid		    VARCHAR(64),
    reviewid		VARCHAR(64)	NOT NULL,
    image_path	    VARCHAR(128),
    created		    DATETIME,
    created_by	    VARCHAR(64),
    modified		DATETIME,
    modified_by	    VARCHAR(64),
    deleted 		VARCHAR(1)	DEFAULT 'N',
    PRIMARY KEY (imageid)
);

ALTER TABLE review_images
ADD FOREIGN KEY (reviewid) REFERENCES reviews(reviewid);