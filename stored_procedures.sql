DROP PROCEDURE IF EXISTS create_new_transaction;

DELIMITER //
CREATE PROCEDURE create_new_transaction(IN parameter_dni INT, IN parameter_amount DECIMAL(10, 2))
BEGIN

	DECLARE variable_dni INT;
    DECLARE variable_id_account INT;
    
	SELECT dni
	INTO variable_dni
	FROM `client`
    WHERE dni = parameter_dni;
    
    IF variable_dni > 0 THEN
		SELECT id_account
        INTO variable_id_account
        FROM `account`
        WHERE dni = parameter_dni;
        
		INSERT INTO `transaction` VALUES(NULL, variable_id_account, variable_dni, parameter_amount, CURDATE());
        
    ELSE
		SELECT 'Transaction rejected because there is no client with the DNI supplied.' AS error_msg;
	END IF;
		

END //
