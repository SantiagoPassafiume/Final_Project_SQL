CREATE TABLE deleted_clients (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	`user` VARCHAR(60) NOT NULL,
	details VARCHAR(150) NOT NULL
    
);

CREATE TABLE created_clients (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	`user` VARCHAR(60) NOT NULL,
	details VARCHAR(150) NOT NULL
);

CREATE TABLE deleted_accounts (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	`user` VARCHAR(60) NOT NULL,
	details VARCHAR(150) NOT NULL
);

CREATE TABLE created_accounts (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	`user` VARCHAR(60) NOT NULL,
	details VARCHAR(150) NOT NULL
);

/*
Los siguientes 2 triggers ("deleted_clients" y "created_clients") se activan al eliminar y crear un cliente respectivamente, guardando la siguiente
información:
1. Fecha
2. Hora
3. Usuario
4. Detalles del cliente (ya sea eliminado o creado).
*/

DELIMITER $$
CREATE TRIGGER deleted_clients
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
	INSERT INTO deleted_clients
	VALUES(NULL, CURDATE(), CURTIME(), USER(),CONCAT('The client "', OLD.client_name, '" with the DNI "', OLD.dni, '" was deleted.'));
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER created_clients
AFTER INSERT ON clients
FOR EACH ROW
BEGIN
	INSERT INTO created_clients
	VALUES(NULL, CURDATE(), CURTIME(), USER(), CONCAT('The client "', NEW.client_name, '" with the DNI "', NEW.dni, '" was created.'));
END$$
DELIMITER ;

/*
Los siguientes 2 triggers ("deleted_accounts" y "created_accounts") se activan al eliminar y crear una cuenta respectivamente, guardando la siguiente
información:
1. Fecha
2. Hora
3. Usuario
4. Detalles de la cuenta (ya sea eliminada o creada).
*/

DELIMITER $$
CREATE TRIGGER deleted_accounts
BEFORE DELETE ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO deleted_accounts
	VALUES(NULL, CURDATE(), CURTIME(), USER(), CONCAT('The account "', OLD.account_name, '" belonging to the client with the DNI "', OLD.dni, '" was deleted.'));
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER created_accounts
AFTER INSERT ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO created_accounts
	VALUES(NULL, CURDATE(), CURTIME(), USER(), CONCAT('The account "', NEW.account_name, '" belonging to the client with the DNI "', NEW.dni, '" was created.'));
END$$
DELIMITER ;
