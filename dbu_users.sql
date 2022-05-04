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
    modified		DATETIME        NOT NULL,
    modified_by	    VARCHAR(64)     NOT NULL,
    deleted 		VARCHAR(1)		DEFAULT 'N',
    PRIMARY KEY (userid)
);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_users_insert_trigger_1

DELIMITER //
CREATE TRIGGER sys_users_insert_trigger_1
BEFORE INSERT ON users
FOR EACH ROW 
BEGIN
    SET NEW.password_reset = CURRENT_TIMESTAMP;
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
    CALL sys_transno_procedure_get_id('USR', @userid);

	SET NEW.userid = @userid;
END //

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO users (email, first_name, last_name, dob, password, json_address, json_user, modified_by, deleted)
VALUES ('hello@canyouhearme.com', 'Bill', 'Nye', '1955-11-27', 'password', '{"street":"123 Yorkshire Place", "city":"Portland", "state":"OR", "zip":"90210"}', '{}', 'eugene', 'N');

