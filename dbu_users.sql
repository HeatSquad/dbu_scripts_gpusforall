CREATE TABLE users 
(
    userid 		    VARCHAR(64)		NOT NULL,
    email		    VARCHAR(500)	NOT NULL,
    first_name		VARCHAR(64)		NOT NULL,
    last_name		VARCHAR(64)		NOT NULL,
    dob             DATE            NOT NULL,
    password		VARCHAR(500)    NOT NULL,
    password_reset  DATETIME        NOT NULL,
    json_address    JSON,
    json_user       JSON,
    created		    DATETIME        NOT NULL,
    created_by	    VARCHAR(64)     NOT NULL,
    modified		DATETIME        NOT NULL,
    modified_by	    VARCHAR(64)     NOT NULL,
    deleted 		VARCHAR(1)		DEFAULT 'N',
    PRIMARY KEY (userid)
);
