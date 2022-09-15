CREATE DATABASE bank_passafiume;
USE bank_passafiume;

CREATE TABLE bank (
	id_bank INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bank_name VARCHAR(60) NOT NULL
);

CREATE TABLE branch (
	id_branch INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	branch_name VARCHAR(60) NOT NULL,
	id_bank INT NOT NULL,
	FOREIGN KEY (id_bank) REFERENCES bank(id_bank)
);

CREATE TABLE `account` (
	id_account INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dni INT NOT NULL,
	id_branch INT NOT NULL,
	account_name VARCHAR(60) NOT NULL
);

CREATE TABLE `client` (
	dni INT NOT NULL PRIMARY KEY,
	id_account INT NOT NULL,
	client_name VARCHAR(60) NOT NULL
);

CREATE TABLE `transaction` (
	id_transaction INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_account INT NOT NULL,
	dni INT NOT NULL,
	amount DECIMAL(10,0) NOT NULL,
	`date` DATE NOT NULL
);

ALTER TABLE `account`
ADD FOREIGN KEY (dni) REFERENCES client(dni), 
ADD FOREIGN KEY (id_branch) REFERENCES branch(id_branch);

ALTER TABLE `client`
ADD FOREIGN KEY (id_account) REFERENCES account(id_account);
