/*
Script de creación de base de datos con sus tablas correspondientes.
*/

CREATE DATABASE bank_passafiume;
USE bank_passafiume;

CREATE TABLE banks (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	bank_name VARCHAR(60) NOT NULL
);

CREATE TABLE branches (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	branch_name VARCHAR(60) NOT NULL,
	id_bank INT NOT NULL,
	FOREIGN KEY (id_bank) REFERENCES banks(id)
);

CREATE TABLE accounts (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dni INT NOT NULL,
	id_branch INT NOT NULL,
	account_name VARCHAR(60) NOT NULL
);

CREATE TABLE clients (
	dni INT NOT NULL PRIMARY KEY,
	id_account INT NOT NULL,
	client_name VARCHAR(60) NOT NULL
);

CREATE TABLE transactions (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_account INT NOT NULL,
	dni INT NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	`date` DATE NOT NULL
);

ALTER TABLE accounts
ADD FOREIGN KEY (dni) REFERENCES clients(dni), 
ADD FOREIGN KEY (id_branch) REFERENCES branches(id);

ALTER TABLE clients
ADD FOREIGN KEY (id_account) REFERENCES accounts(id);

