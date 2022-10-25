SET AUTOCOMMIT = 0;

START TRANSACTION;

-- En este caso elegi usar INSERT en vez de DELETE por comodidad y evitar errores.
INSERT INTO banks (id, bank_name)
VALUES(4, "ICBC"),(5, "HSBC"),(6, "Patagonia");

-- ROLLBACK;
-- COMMIT;

INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(1, 32423434, 3, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(2, 31234334, 2, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(3, 30232242, 1, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(3, 32423434, 3, "Caja de Ahorro");
SAVEPOINT inserts_1;
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(2, 31234334, 2, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(1, 30232242, 1, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(2, 31234334, 2, "Caja de Ahorro");
INSERT INTO accounts (id, dni, id_branch, account_name) VALUES(3, 32423434, 3, "Caja de Ahorro");
SAVEPOINT inserts_2;

RELEASE SAVEPOINT inserts_1;
