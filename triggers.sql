CREATE TABLE deleted_clients (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	details VARCHAR(150) NOT NULL
);

CREATE TABLE created_clients (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	details VARCHAR(150) NOT NULL
);


DELIMITER $$
CREATE TRIGGER deleted_clients
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
	INSERT INTO deleted_clients
    VALUES(NULL, CURDATE(), CONCAT('The client "', OLD.client_name, '" with the DNI "', OLD.dni, '" was deleted.'));
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER created_clients
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
	INSERT INTO created_clients
    VALUES(NULL, CURDATE(), CONCAT('The client "', NEW.client_name, '" with the DNI "', NEW.dni, '" was created.'));
END$$
DELIMITER ;
