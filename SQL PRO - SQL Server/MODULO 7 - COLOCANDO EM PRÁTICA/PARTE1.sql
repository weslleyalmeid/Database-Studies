-- 1 � Crie a tabela de PESSOAS com as colunas de ID, Nome, Idade, Profiss�o e Sal�rio;
CREATE TABLE PESSOAS(
	Id INT IDENTITY(1, 1),
	Nome VARCHAR(20),
	Idade INT,
	Profissao VARCHAR(20),
	Salario FLOAT
)

-- 2 � Insira na tabela rec�m criada os 5 registros abaixo:
INSERT INTO PESSOAS VALUES('Jo�o', 24, 'Analista', 5000)
INSERT INTO PESSOAS VALUES('Maria', 23, 'Arquiteta', 3500)
INSERT INTO PESSOAS VALUES('Andr�', 26, 'Engenheiro', 5500)
INSERT INTO PESSOAS VALUES('Carlos', 27,'Eletricista', 2800)
INSERT INTO PESSOAS VALUES('Bruna', 22, 'Engenheira', 5600)


-- 3 � Jo�o foi promovido, atualize o sal�rio dele de 5000 para 6000;
UPDATE PESSOAS SET Salario = 6000 
WHERE Nome = 'Jo�o'

SELECT * FROM PESSOAS

-- 4 � Adicione uma nova coluna na tabela chamada de Estado, e atualize todos os registros para que identifique que eles moram em S�o Paulo;
ALTER TABLE PESSOAS
ADD Estado VARCHAR(20)

UPDATE PESSOAS SET Estado = 'S�o Paulo'

-- 5 � Crie uma query que retorne quantas pessoas existem na tabela por tipo de profiss�o
-- (Dica: � necess�rio tratar a diferen�a de g�nero de Engenheiro/Engenheira);
SELECT
Profissao,
COUNT(1) AS QTD_PROFISS�O,
SUBSTRING(Profissao, 1, LEN(Profissao) - 1) AS SEM_GENERO
FROM PESSOAS
GROUP BY Profissao

WITH PESSOAS2 AS (
	SELECT
	SUBSTRING(Profissao, 1, LEN(Profissao) - 1) AS SEM_GENERO
	FROM PESSOAS
)
SELECT
SEM_GENERO,
COUNT(1) AS QTD_PROFISSAO
FROM PESSOAS2
GROUP BY SEM_GENERO
ORDER BY SEM_GENERO DESC

