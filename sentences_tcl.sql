SET AUTOCOMMIT = 0;

START TRANSACTION;

-- En este caso elegi usar INSERT en vez de DELETE por comodidad y evitar errores.
INSERT INTO banks (id, bank_name)
VALUES(4, "ICBC"),(5, "HSBC"),(6, "Patagonia");

-- ROLLBACK;
-- COMMIT;

INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(4,3,32423434,55213,'2019-01-05');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(5,2,31234334,34634,'2020-01-02');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(6,1,30232242,21309,'2022-01-08');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(7,3,32423434,71231,'2021-01-09');
SAVEPOINT inserts_1;
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(8,2,31234334,21313,'2018-01-10');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(9,1,30232242,53143,'2020-01-12');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(10,3,32423434,63245,'2019-01-03');
INSERT INTO transactions (id, id_account, dni, amount, `date`) VALUES(11,2,31234334,12313,'2022-01-06');
SAVEPOINT inserts_2;

-- RELEASE SAVEPOINT inserts_1;
