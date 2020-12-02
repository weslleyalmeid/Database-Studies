-- Curso SQL-PRO
CREATE TABLE TABELA (
	ID INT NOT NULL,
	NOME VARCHAR(30) NOT NULL,
	IDADE INT NOT NULL,
	CPF INT NOT NULL
);

SELECT * FROM TABELA;

INSERT INTO TABELA
VALUES (1, 'WESLLEY', 25, 00950348201);

SELECT ID, NOME FROM TABELA;

INSERT INTO TABELA(ID, NOME, IDADE)
VALUES (1, 'WESLLEY', 25);

INSERT INTO TABELA
VALUES (1, 'TESTE', 25, NULL);

DROP TABLE TABELA;

/*
DDL -  Data definition Language
	CRETE
	ALTER
	DROP

DML - Data modelin language
	SELECT
	INSERT
	DELETE
	UPDATE
*/

SELECT * FROM TABELA;

INSERT INTO TABELA
VALUES (1, 'WESLLEY', 25, 00950348201);

INSERT INTO TABELA
VALUES (2, 'TEST', 25, 00853348201);

UPDATE TABELA SET IDADE = 26
WHERE NOME = 'WESLLEY' AND ID = 1;

DELETE FROM TABELA
WHERE NOME = 'TEST'

SELECT * FROM TABELA;


DROP TABLE TABELA;

CREATE TABLE TABELA (
	ID INT,
	IDADE VARCHAR(4)
);

ALTER TABLE TABELA
ALTER COLUMN IDADE INT;

ALTER TABLE TABELA
DROP COLUMN IDADE;

ALTER TABLE TABELA
ADD IDADE INT;