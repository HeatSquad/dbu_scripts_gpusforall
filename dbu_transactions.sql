CREATE TABLE transactions
(
    transactionid	VARCHAR(64)	NOT NULL,
    orderid		    VARCHAR(64)	NOT NULL,
    userid		    VARCHAR(64)	NOT NULL,
    status		    VARCHAR(64)	NOT NULL DEFAULT 'waiting',
    subtotal        INT         NOT NULL,
    grand_total     INT         NOT NULL,
    applied_tax_percent INT     NOT NULL,
    discount        INT         NOT NULL,
    json_billing    JSON,            
    json_shipping   JSON,            
    created		    DATETIME	NOT NULL,
    created_by      VARCHAR(64)	NOT NULL,
    modified		DATETIME	NOT NULL,
    modified_by	    VARCHAR(64)	NOT NULL,
    deleted		    VARCHAR(1)	DEFAULT 'N',
    PRIMARY KEY (orderid)
);

ALTER TABLE shoppingcart
FOREIGN KEY (userid) REFERENCES users(userid);
