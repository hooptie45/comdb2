CREATE TABLE t1(i INT) $$

SET maxtransize 2;
BEGIN;
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(2);
COMMIT;

BEGIN;
INSERT INTO t1 VALUES(3);
INSERT INTO t1 VALUES(4);
INSERT INTO t1 VALUES(5);
COMMIT;

SELECT COUNT(*)=2 FROM t1;

TRUNCATE TABLE t1;

SET TRANSACTION READ COMMITTED;
BEGIN;
INSERT INTO t1 VALUES(6);
INSERT INTO t1 VALUES(7);
COMMIT;

BEGIN;
INSERT INTO t1 VALUES(8);
INSERT INTO t1 VALUES(9);
INSERT INTO t1 VALUES(10);
COMMIT;

SELECT COUNT(*)=2 FROM t1;

DROP TABLE t1;
