-- First Stored Procedure:
-- Devuelve la lista completa de clientes, ordenandola en base al primer parámetro, y decidiendo si es ascendente o descendente en el segundo parámetro.
--
-- Ejemplo de uso: CALL ordered_list_of_clients('dni', 'ASC');

DROP PROCEDURE IF EXISTS ordered_list_of_clients;

DELIMITER $$
CREATE PROCEDURE ordered_list_of_clients(IN p_order_column VARCHAR(100), IN p_order_type varchar(4))
BEGIN

	SET @order_by = CONCAT(' ORDER BY ', p_order_column, ' ', p_order_type);
    
	SET @clause = CONCAT('SELECT dni, id_account, client_name FROM `client`', @order_by);
    
	PREPARE my_clause FROM @clause;
	EXECUTE my_clause;
	DEALLOCATE PREPARE my_clause;

END$$
DELIMITER ;





-- Second Stored Procedure:
-- Crea una nueva transacción a partir del DNI de un cliente registrado y una cantidad de dinero.
-- Si el DNI no existe (el cliente no existe), rechaza la transacción con un error.
--
-- Ejemplo de uso: CALL create_new_transaction(32423434, 10234.23);

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
		

END//
DELIMITER ;
