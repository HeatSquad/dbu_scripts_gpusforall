CREATE TABLE registry 
(
    pm_id           INT             NOT NULL,
    name 		    VARCHAR(64)		NOT NULL,
    service_path    VARCHAR(32)     NOT NULL,
    pid             INT             NOT NULL,
    instances       INT             NOT NULL,
    ipaddress       VARCHAR(40)     NOT NULL,
    subnet_mask     VARCHAR(40),
    port            INT             NOT NULL,
    json_process    JSON,
    status          VARCHAR(64)     NOT NULL, -- online || stopped || errored
    created		    DATETIME        NOT NULL,
    modified		DATETIME        NOT NULL,
    PRIMARY KEY (pm_id)
);

-- ========================================================
-- Triggers
-- ========================================================
DROP TRIGGER sys_procmanager_trigger_1

DELIMITER //
CREATE TRIGGER sys_procmanager_insert_trigger_1
BEFORE INSERT ON registry
FOR EACH ROW 
BEGIN
    SET NEW.created = CURRENT_TIMESTAMP;
    SET NEW.modified = CURRENT_TIMESTAMP;
END //

DELIMITER ;

DROP TRIGGER sys_procmanager_trigger_2

DELIMITER //
CREATE TRIGGER sys_procmanager_trigger_2
BEFORE UPDATE ON registry
FOR EACH ROW 
BEGIN
    SET NEW.modified = CURRENT_TIMESTAMP;
END //

DELIMITER ;