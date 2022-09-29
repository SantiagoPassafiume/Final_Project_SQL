CREATE OR REPLACE VIEW all_banks AS
	(SELECT bank_name, id_bank FROM bank);
  
CREATE OR REPLACE VIEW all_branches AS
	(SELECT id_branch, branch_name, id_bank FROM branch);
  
CREATE OR REPLACE VIEW all_clients AS
	(SELECT id_account, dni, client_name FROM `client`);
  
CREATE OR REPLACE VIEW all_accounts AS
	(SELECT id_account, dni, id_branch, account_name FROM `account`);
  
CREATE OR REPLACE VIEW all_transactions AS
	(SELECT id_transaction, id_account, dni, amount, `date` FROM `transaction`);
  
CREATE OR REPLACE VIEW highest_transaction AS
	(SELECT MAX(amount) AS "Highest transaction" FROM `transaction`);
