-- 1 – Crie a tabela de PESSOAS com as colunas de ID, Nome, Idade, Profissão e Salário;
CREATE TABLE PESSOAS(
	Id INT IDENTITY(1, 1),
	Nome VARCHAR(20),
	Idade INT,
	Profissao VARCHAR(20),
	Salario FLOAT
)

-- 2 – Insira na tabela recém criada os 5 registros abaixo:
INSERT INTO PESSOAS VALUES('João', 24, 'Analista', 5000)
INSERT INTO PESSOAS VALUES('Maria', 23, 'Arquiteta', 3500)
INSERT INTO PESSOAS VALUES('André', 26, 'Engenheiro', 5500)
INSERT INTO PESSOAS VALUES('Carlos', 27,'Eletricista', 2800)
INSERT INTO PESSOAS VALUES('Bruna', 22, 'Engenheira', 5600)


-- 3 – João foi promovido, atualize o salário dele de 5000 para 6000;
UPDATE PESSOAS SET Salario = 6000 
WHERE Nome = 'João'

SELECT * FROM PESSOAS

-- 4 – Adicione uma nova coluna na tabela chamada de Estado, e atualize todos os registros para que identifique que eles moram em São Paulo;
ALTER TABLE PESSOAS
ADD Estado VARCHAR(20)

UPDATE PESSOAS SET Estado = 'São Paulo'

-- 5 – Crie uma query que retorne quantas pessoas existem na tabela por tipo de profissão
-- (Dica: É necessário tratar a diferença de gênero de Engenheiro/Engenheira);
SELECT
Profissao,
COUNT(1) AS QTD_PROFISSÃO,
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

