SELECT
BusinessEntityID,
FirstName,
LastName
FROM Person.Person
ORDER BY FirstName, LastName ASC

SELECT
FirstName,
LastName,
COUNT(1)
FROM Person.Person
GROUP BY FirstName, LastName
HAVING COUNT(1) > 1
ORDER BY COUNT(1) DESC

-- CONFIRMAR SE O COUNT FUNCIONOU CORRETAMENTE
SELECT * FROM Person.Person
WHERE FirstName = 'Laura' AND LastName = 'Norman'


/* APÓS VERIFICADO DADOS DUPLICADOS É REQUERIDO APENAS
UM ÚNIDO DADO MANTENDO O ID MAIS ANTIGO */
-- Row Number - mantém o controle de linha do elemento duplicado

SELECT
BusinessEntityID,
FirstName,
LastName,
ROW_NUMBER() OVER(PARTITION BY FirstName, LastName ORDER BY BusinessEntityID ASC) NUM_LINHA
FROM Person.Person
-- WHERE FirstName = 'Laura' AND LastName = 'Norman'
ORDER BY FirstName, LastName ASC

WITH CTE AS (
	SELECT
	BusinessEntityID,
	ROW_NUMBER() OVER(PARTITION BY FirstName, LastName ORDER BY BusinessEntityID ASC) NUM_LINHA
	FROM Person.Person
) SELECT BusinessEntityID INTO REGISTRO__DELETAR FROM CTE WHERE NUM_LINHA > 1

SELECT * FROM REGISTRO__DELETAR

SELECT * INTO PESSOAS
FROM Person.Person

SELECT * FROM PESSOAS

DELETE FROM PESSOAS
WHERE BusinessEntityID IN (SELECT DISTINCT BusinessEntityID FROM REGISTRO__DELETAR)

-- COMPARANDO TABELAS
SELECT * FROM Person.Person
WHERE FirstName = 'Laura' AND LastName = 'Norman'

SELECT * FROM PESSOAS
WHERE FirstName = 'Laura' AND LastName = 'Norman'