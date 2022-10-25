SET AUTOCOMMIT = 0;

START TRANSACTION;

-- En este caso elegi usar INSERT en vez de DELETE por comodidad y evitar errores.
INSERT INTO banks (id, bank_name)
VALUES(4, "ICBC"),(5, "HSBC"),(6, "Patagonia");

-- ROLLBACK;
-- COMMIT;

INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,55213,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,34634,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,21309,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,71231,'2022-01-01');
SAVEPOINT inserts_1;
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,21313,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,53143,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,63245,'2022-01-01');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(1,3,32423434,12313,'2022-01-01');
SAVEPOINT inserts_2;

-- RELEASE SAVEPOINT inserts_1;
