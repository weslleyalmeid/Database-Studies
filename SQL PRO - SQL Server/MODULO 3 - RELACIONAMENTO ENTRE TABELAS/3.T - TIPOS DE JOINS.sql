CREATE TABLE TABELA1 (
ID INT,
NOME VARCHAR(30)
)

CREATE TABLE TABELA2 (
ID INT,
NOME VARCHAR(30)
)

INSERT INTO TABELA1 VALUES(1, 'weslley')
INSERT INTO TABELA1 VALUES(2, 'joao')
INSERT INTO TABELA1 VALUES(3, 'maria')

INSERT INTO TABELA2 VALUES(2, 'joao')
INSERT INTO TABELA2 VALUES(3, 'maria')
INSERT INTO TABELA2 VALUES(4, 'paulo')


SELECT * FROM TABELA1
SELECT * FROM TABELA2


-- INNER JOIN
SELECT * FROM TABELA1 AS A
INNER JOIN TABELA2 AS B
ON A.ID = B.ID



SELECT * FROM TABELA1
SELECT * FROM TABELA2

-- LEFT JOIN
SELECT * FROM TABELA1 AS A
LEFT JOIN TABELA2 AS B
ON A.ID = B.ID


SELECT * FROM TABELA1
SELECT * FROM TABELA2

-- RIGHT JOIN
SELECT * FROM TABELA1 AS A
RIGHT JOIN TABELA2 AS B
ON A.ID = B.ID

SELECT * FROM TABELA1
SELECT * FROM TABELA2

-- FULL OUTER JOIN
SELECT * FROM TABELA1 AS A 
FULL OUTER JOIN TABELA2 AS B
ON A.ID = B.ID

SELECT ID, NOME FROM TABELA1
UNION
SELECT ID, NOME FROM TABELA2

SELECT ID, NOME FROM TABELA1
UNION ALL
SELECT ID, NOME FROM TABELA2




CREATE TABLE TABELA3 (
NOME VARCHAR(30),
IDADE INT
)


INSERT INTO TABELA3 VALUES('Weslley', 25)
INSERT INTO TABELA3 VALUES('Weslley', 26)
INSERT INTO TABELA3 VALUES('Weslley', 27)
INSERT INTO TABELA3 VALUES('Weslley', 28)

SELECT NOME, IDADE FROM TABELA3
SELECT DISTINCT NOME, IDADE FROM TABELA3


DROP TABLE TABELA3