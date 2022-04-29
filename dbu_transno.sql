CREATE TABLE transno
(
    prefix        VARCHAR(64)	NOT NULL,
    current_seq   INT         NOT NULL,       
    description   VARCHAR(64)	NOT NULL
);

-- ========================================================
-- Stored Procedure
-- ========================================================

DROP PROCEDURE sys_transno_procedure_get_userid

DELIMITER //

CREATE PROCEDURE sys_transno_procedure_get_userid (IN pre_fix VARCHAR(64), OUT userid VARCHAR(64))
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
    INTO userid
    FROM transno
    WHERE prefix = pre_fix;
END//

DELIMITER ;