INSERT INTO bank (id_bank, bank_name)
VALUES(1, "BBVA"),(2, "Santander"),(3, "Galicia");

INSERT INTO branch (id_branch, branch_name, id_bank)
VALUES(1, "Sorrento", 3),(2, "Paz", 2),(3, "Retiro", 1);

INSERT INTO `account` (id_account, dni, id_branch, account_name)
VALUES(1, 32423434, 3, "Caja de Ahorro"),(2, 31234334, 2, "Cuenta Corriente"),(3, 30232242, 1, "Cuenta USD");

INSERT INTO `client` (dni, id_account, client_name)
VALUES(32423434, 1, "Pedro Suarez"),(31234334, 2, "Ismael Rosas"),(30232242, 3, "Carlos Fernandez");

INSERT INTO `transaction` (id_transaction, id_account, dni, amount, `date`)
VALUES(1,3,32423434,1500,'2022-01-01'),(2,2,31234334,3000,'2021-02-02'),(3,1,30232242,4500,'2020-03-03');
