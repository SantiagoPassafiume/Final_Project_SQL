/*
La función "get_highest_transaction_in_year" toma como input un año (ejemplo: 2022) y devuelve la transacción con el mayor "amount" de ese año.
*/

DELIMITER $$
CREATE FUNCTION get_highest_transaction_in_year (year_of_transaction INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN

	DECLARE highest_transaction DECIMAL(10,2);

	SELECT amount
	INTO highest_transaction
	FROM transactions
	WHERE YEAR(`date`) = year_of_transaction
	ORDER BY amount DESC
	LIMIT 1;

	RETURN highest_transaction;
    
END$$
DELIMITER ;


/*
La función "get_average_transaction_in_year" toma como input un año (ejemplo: 2022) y devuelve el promedio entre los montos de las transacciones
del mismo.
*/

DELIMITER $$
CREATE FUNCTION get_average_transaction_in_year (year_of_transaction INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN

	DECLARE average_transaction DECIMAL(10,2);

	SELECT AVG(amount)
	INTO average_transaction
	FROM transactions
	WHERE YEAR(`date`) = year_of_transaction;

	RETURN average_transaction;
    
END$$
DELIMITER ;
