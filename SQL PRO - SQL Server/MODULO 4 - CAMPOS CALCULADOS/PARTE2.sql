CREATE TABLE FUNCIONARIOS(
	SETOR VARCHAR(30),
	NOME VARCHAR(30),
	LUCRO INT
)


INSERT INTO FUNCIONARIOS VALUES ('VENDAS','Weslley', 25)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','Joao', 21)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','Maria', 18)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','Rubert', 18)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','tompson', 18)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','Lorem', 18)
INSERT INTO FUNCIONARIOS VALUES('DEV','Jose', 11)
INSERT INTO FUNCIONARIOS VALUES('DEV','Bruno', 13)
INSERT INTO FUNCIONARIOS VALUES('DEV','Andreia', 15)
INSERT INTO FUNCIONARIOS VALUES('DEV','Carlos', 64)
INSERT INTO FUNCIONARIOS VALUES('MARKETING','Luis', 45)
INSERT INTO FUNCIONARIOS VALUES('MARKETING','Lara', 32)
INSERT INTO FUNCIONARIOS VALUES('MARKETING','Anderson', 31)
INSERT INTO FUNCIONARIOS VALUES ('VENDAS','Weslley', 25)
INSERT INTO FUNCIONARIOS VALUES('VENDAS','Joao', 21)


SELECT * FROM FUNCIONARIOS

SELECT 
SETOR,
SUM(LUCRO) ,
COUNT(NOME) AS 'TOTAL DE PESSOAS'
FROM FUNCIONARIOS
GROUP BY SETOR
HAVING COUNT(NOME) > 3


CREATE TABLE DUPLICADOS(
NOME VARCHAR(30)
)

INSERT INTO DUPLICADOS VALUES('WESLLEY')
INSERT INTO DUPLICADOS VALUES('JOAO')
INSERT INTO DUPLICADOS VALUES('MARIA')
INSERT INTO DUPLICADOS VALUES('JOSE')

SELECT * FROM DUPLICADOS

-- VERIFICA NOMES DUPLICADOS
SELECT
NOME, 
COUNT(NOME) 
FROM DUPLICADOS
GROUP BY NOME
HAVING COUNT(NOME) > 1


DROP TABLE DUPLICADOS


-- CASE WHEN
SELECT * FROM FUNCIONARIOS

SELECT
SETOR, 
NOME,
LUCRO,
CASE WHEN
	LUCRO > 40 THEN 'LUCRO � OTIMO'
	WHEN
	LUCRO > 20 THEN 'LUCRO � BOM'
	ELSE
		'LUCRO � RUIM'
END ANALISE_LUCRO
FROM FUNCIONARIOS


