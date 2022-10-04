DELIMITER $$
CREATE FUNCTION get_highest_transaction_in_year (year_of_transaction INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN

	DECLARE highest_transaction DECIMAL(10,2);

	SELECT amount
	INTO highest_transaction
	FROM `transaction`
	WHERE YEAR(`date`) = year_of_transaction
	ORDER BY amount DESC
	LIMIT 1;

	RETURN highest_transaction;
    
END$$
DELIMITER ;
