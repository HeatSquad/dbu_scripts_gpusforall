CREATE TABLE trans_no
(
    prefix        VARCHAR(64)	NOT NULL,
    current_seq   INT         NOT NULL,       
    description   VARCHAR(64)	NOT NULL
);

-- ========================================================
-- Stored Procedure
-- ========================================================

DROP PROCEDURE sys_trans_no_procedure_get_id

DELIMITER //

CREATE PROCEDURE sys_trans_no_procedure_get_id (IN pre_fix VARCHAR(64), OUT id VARCHAR(64))
BEGIN
    DECLARE currentseq INT;

    SELECT current_seq
    INTO currentseq
    FROM trans_no
    WHERE prefix = pre_fix;

    UPDATE trans_no
    SET current_seq = currentseq + 1
    WHERE prefix = pre_fix;

    SELECT CONCAT(prefix, LPAD(CONVERT(current_seq, CHAR) , 5, '0'))
    INTO id
    FROM trans_no
    WHERE prefix = pre_fix;
END//

DELIMITER ;

-- ========================================================
-- Inserts
-- ========================================================
INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('USR', 0, 'userid for sys.users table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('PRO', 0, 'productid for sys.products table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('ORD', 0, 'orderid for sys.orders table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('IMGP', 0, 'imageid for sys.product_images table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('REV', 0, 'reviewid for sys.reviews table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('CAR', 0, 'cartid for sys.shopping_cart table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('WSH', 0, 'wishlistid for sys.wish_list table');

INSERT INTO sys.trans_no (prefix, current_seq, description)
VALUES ('IMGR', 0, 'iamgeid for sys.review_images table');