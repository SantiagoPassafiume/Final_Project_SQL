SET AUTOCOMMIT = 0;

START TRANSACTION;

-- En este caso elegi usar INSERT en vez de DELETE por comodidad y evitar errores.
INSERT INTO banks (id, bank_name)
VALUES(4, "ICBC"),(5, "HSBC"),(6, "Patagonia");

-- ROLLBACK;
-- COMMIT;

INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(4,3,32423434,55213,'2022-11-20');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(5,2,31234334,34634,'2022-11-21');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(6,1,30232242,21309,'2022-11-22');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(7,3,32423434,71231,'2022-11-23');
SAVEPOINT transactions_1;
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(8,2,31234334,21313,'2012-11-24');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(9,1,30232242,53143,'2022-11-25');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(10,3,32423434,63245,'2012-11-26');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(11,2,31234334,12313,'2022-11-27');
SAVEPOINT transactions_2;

-- RELEASE SAVEPOINT transactions_1;
