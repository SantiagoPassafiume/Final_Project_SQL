-- Mostrar todos los bancos.
CREATE OR REPLACE VIEW all_banks AS
	(SELECT id_bank, bank_name FROM banks);

-- Mostrar todas las sucursales de bancos.
CREATE OR REPLACE VIEW all_branches AS
	(SELECT id_branch, branch_name, id_bank FROM branches);

-- Mostrar todos los clientes.
CREATE OR REPLACE VIEW all_clients AS
	(SELECT id_account, dni, client_name FROM clients);
 
-- Mostrar todas las cuentas de clientes.
CREATE OR REPLACE VIEW all_accounts AS
	(SELECT id_account, dni, id_branch, account_name FROM accounts);
  
-- Mostrar todas las transacciones.
CREATE OR REPLACE VIEW all_transactions AS
	(SELECT id_transaction, id_account, dni, amount, `date` FROM transactions);

-- Mostrar la mayor transacción realizada.
CREATE OR REPLACE VIEW highest_transaction AS
	(SELECT MAX(amount) AS "Highest Transaction" FROM transactions);
