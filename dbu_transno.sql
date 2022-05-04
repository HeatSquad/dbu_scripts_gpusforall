CREATE TABLE transno
(
    prefix        VARCHAR(64)	NOT NULL,
    current_seq   INT         NOT NULL,       
    description   VARCHAR(64)	NOT NULL
);

-- ========================================================
-- Stored Procedure
-- ========================================================

DROP PROCEDURE sys_transno_procedure_get_id

DELIMITER //

CREATE PROCEDURE sys_transno_procedure_get_id (IN pre_fix VARCHAR(64), OUT id VARCHAR(64))
BEGIN
    DECLARE currentseq INT;

    SELECT current_seq
    INTO currentseq
    FROM transno
    WHERE prefix = pre_fix;

    UPDATE transno
    SET current_seq = currentseq + 1
    WHERE prefix = pre_fix;

    SELECT CONCAT(prefix, LPAD(CONVERT(current_seq, CHAR) , 5, '0'))
    INTO id
    FROM transno
    WHERE prefix = pre_fix;
END//

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.transno (prefix, current_seq, description)
VALUES ('USR', 0, 'userid for sys.users table');

INSERT INTO sys.transno (prefix, current_seq, description)
VALUES ('PRO', 0, 'productid for sys.products table');

INSERT INTO sys.transno (prefix, current_seq, description)
VALUES ('ORD', 0, 'orderid for sys.orders table');

INSERT INTO sys.transno (prefix, current_seq, description)
VALUES ('IMG', 0, 'imageid for sys.product_images table');