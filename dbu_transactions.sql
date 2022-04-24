CREATE TABLE transactions
(
    transactionid	VARCHAR(64)	NOT NULL,
    orderid		    VARCHAR(64)	NOT NULL,
    userid		    VARCHAR(64)	NOT NULL,
    status		    VARCHAR(64)	NOT NULL DEFAULT 'waiting',
    subtotal        INT,       
    grand_total     INT,        
    applied_tax_percent INT,     
    discount        INT,         
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
ADD FOREIGN KEY (userid) REFERENCES users(userid);
