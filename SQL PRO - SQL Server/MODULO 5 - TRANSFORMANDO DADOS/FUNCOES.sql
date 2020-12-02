-- CONCAT
SELECT
FirstName,
MiddleName,
LastName,
CONCAT(FirstName,' ', MiddleName,' ', LastName) AS CONCAT_NAME
FROM Person.Person;

-- LIKE - Procurar por algo que iniciam ou terminam
-- UPPER -  deixar as palavras no maiúsculo
-- LOWER - todas as palavras no minúsculo
SELECT
FirstName,
UPPER(FirstName) AS NOME_MAISCULO,
LOWER(FirstName) AS nome_minusculo
FROM Person.Person
WHERE FirstName LIKE '%K%'

-- SUBSTRING (COLUNA, POS_INICIAL, QTD)
-- INSTR = CHARINDEX  CHARINDEX(ELEMENTO, COLUNA, POS_INICIAL)
SELECT
FirstName,
SUBSTRING(FirstName, 2, 3) AS SUBSTRING_NAME,
CHARINDEX('K', FirstName, 1) AS INSTR
FROM Person.Person
WHERE FirstName LIKE '%K%';


SELECT CONCAT(FirstName,' ', MiddleName,' ', LastName) AS NOME_COMPLETO
INTO TABELA_NOME
FROM Person.Person
WHERE CONCAT(FirstName,' ', MiddleName,' ', LastName) IS NOT NULL

-- obtendo primeiro nome dinamicamente
SELECT
NOME_COMPLETO,
SUBSTRING(NOME_COMPLETO, 1, 4) AS SUBSTR,
CHARINDEX(' ', NOME_COMPLETO, 1) AS CINDEX,
SUBSTRING(NOME_COMPLETO, 1, CHARINDEX(' ', NOME_COMPLETO, 1)) AS FIRST_NAME
FROM TABELA_NOME;


-- limpar tabela
TRUNCATE TABLE TABELA_NOME

SELECT * FROM TABELA_NOME

INSERT INTO TABELA_NOME VALUES('     Weslley N Almeida        ')

-- TRIM tira os espaços em excesso, L e R TRIM tira o excesso em apenas um dos lados
SELECT 
NOME_COMPLETO,
TRIM(NOME_COMPLETO) AS TRIM_NAME,
LTRIM(NOME_COMPLETO) AS LTRIM_NAME,
RTRIM(NOME_COMPLETO) AS RTRIM_NAME
FROM TABELA_NOME;

--BETWEEN - é comum usarem em datas
SELECT * FROM Sales.SalesOrderDetail
WHERE ModifiedDate between '2012-01-01' and '2013-01-01'
ORDER BY SalesOrderID DESC-- CAST(VALUES AS TYPE)SELECT CAST(14 AS INT)SELECT CAST(GETDATE()  AS VARCHAR(30))