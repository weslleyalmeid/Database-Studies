#	AULA 63 - CRIANDO TABELAS - Tabela alunos
CREATE TABLE alunos (
 id_aluno INT NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (id_aluno));

ALTER TABLE alunos
ADD COLUMN `nome` VARCHAR(100) NOT NULL AFTER `id_aluno`,
ADD COLUMN `data_nascimento` DATE NOT NULL AFTER `nome`,
ADD COLUMN `endereco` VARCHAR(255) NOT NULL AFTER `data_nascimento`,
ADD COLUMN `cidade` VARCHAR(100) NOT NULL AFTER `endereco`,
ADD COLUMN `estado` VARCHAR(2) NOT NULL AFTER `cidade`,
ADD COLUMN `cpf` VARCHAR(11) NOT NULL AFTER `estado`;
#Identificador de aluno

#Tabela cursos
CREATE TABLE cursos (
  id_curso INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_curso));

ALTER TABLE cursos
ADD COLUMN `nome` VARCHAR(100) NOT NULL AFTER `id_curso`;
#Identificador de curso (chave primária - tipo número)

#Tabela notas
CREATE TABLE notas (
  id_nota INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_nota));

ALTER TABLE notas 
ADD COLUMN `descricao_atividade` VARCHAR(100) NOT NULL AFTER `id_nota`,
ADD COLUMN `vlr_nota` DECIMAL(5,2) NOT NULL AFTER `descricao_atividade`;
#Identificador de notas (chaves primária - tipo número)

#	AULA 67 - APAGANDO TABELAS
# APAGADA A BASE INTEIRA -> DROP DATABASE
DROP TABLE alunos

#	AULA 65 - INSERIR DADOS EM UMA TABELA
INSERT INTO alunos
VALUES (DEFAULT, 'Weslley Almeida', '1994-06-29', 'Rua Luis Favreto, 20', 'Pato Branco', 'PR', '12345678911'),
(DEFAULT, 'William Almeida', '1999-11-30', 'Rua Luis Favreto, 20', 'Pato Branco', 'PR', '12345678910'),
(DEFAULT, 'Lhais', '1992-10-23', 'Rua Luis Favreto, 20', 'Pato Branco', 'PR', '12345678912'),
(DEFAULT, 'Mulan', '1994-11-23', 'Rua Luis Favreto, 20', 'Pato Branco', 'PR', '12345678914'),
(DEFAULT, 'Vrumps', '1999-10-29', 'Rua Luis Favreto, 20', 'Pato Branco', 'PR', '12345678919');

/*
	AULA 66 - ATUALIZAR OU EDITAR DADOS
	UPADATE table_name
	SET column1 = value1, column2 = value2, ...
	WHERE condition
*/
UPDATE alunos
SET cidade = 'Chopinzinho' 
WHERE id_aluno = 8;

UPDATE alunos
SET cidade = 'Cacoal'
WHERE id_aluno = 9;

/*
	AULA 70 - DELETAR UMA TABELA INTERNA
	DELETE FROM table_name
	WHERE condition
*/
DELETE FROM alunos
WHERE id_aluno = 5;

/*
	AULA 71 - FAZENDO BUSCA DENTRO DE UMA TABELA
*/
SELECT nome, cidade, data_nascimento, cpf
FROM alunos
WHERE cidade = 'Pato Branco';

#Ordenado pelo nome
SELECT *
FROM alunos
ORDER BY nome;

#Ordenado pela cidade
SELECT *
FROM alunos
ORDER BY cidade;

#Ordenado pelo nome descendente
SELECT *
FROM alunos
ORDER BY nome DESC;

#Ordenado pelo nome descendente
SELECT nome, data_nascimento, endereco
FROM alunos
ORDER BY 2 DESC;

/*
	Aula 72 - Operadores lógicos
*/
#	OPERADORES CONDICIONAIS
SELECT *
FROM alunos
WHERE id_aluno = 6 or id_aluno = 7;

SELECT *
FROM alunos
WHERE id_aluno = 6 and id_aluno = 7;

# OPERADORES RELACIONAIS >=, <=, >, <, <>
SELECT *
FROM alunos
WHERE data_nascimento <> '1994-06-29';

CREATE TABLE `alunos_cursos` (
`id_aluno_curso` int(11) NOT NULL AUTO_INCREMENT,
`id_aluno` int(11) NOT NULL,
`id_curso` int(11) NOT NULL,
 PRIMARY KEY (`id_aluno_curso`),
 KEY `fk_alunos_cursos_1_idx` (`id_aluno`),
 KEY `fk_alunos_cursos_2_idx` (`id_curso`),
 CONSTRAINT `fk_alunos_cursos_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT `fk_alunos_cursos_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*
	Aula 74 - Criando as chaves estrangeiras
*/
ALTER TABLE `escola_curso`.`alunos_cursos` 
ADD INDEX `fk_id_aluno_idx` (`id_aluno` ASC) VISIBLE,
ADD INDEX `fk_id_curso_idx` (`id_curso` ASC) VISIBLE;
;
ALTER TABLE `escola_curso`.`alunos_cursos` 
ADD CONSTRAINT `fk_id_aluno`
  FOREIGN KEY (`id_aluno`)
  REFERENCES `escola_curso`.`alunos` (`id_aluno`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_id_curso`
  FOREIGN KEY (`id_curso`)
  REFERENCES `escola_curso`.`cursos` (`id_curso`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  /* Aula 75 - Joins */

# POVOANDO TABELAS ALUNOS
INSERT INTO alunos VALUES
(DEFAULT,'Pedro Martins', '1987-07-17', 'Av. Ant. Carlos, 6673', 'BELO HORIZONTE', 'MG', '12345678911'),
(DEFAULT,'Diego Mariano', '1990-01-01', 'Av. Ant. Carlos, 6673', 'BELO HORIZONTE', 'MG', '01234567891'),
(DEFAULT,'Fliper Ama', '2017-01-01', 'Av. Ant. Carlos, 6600', 'BELO HORIZONTE', 'MG', '11111111111'),
(DEFAULT,'Pedro Martins', '1997-02-13', 'Av. Brasil, 1000', 'CABO FRIO', 'RJ', '22222222222'),
(DEFAULT,'REGINA CAZÉ', '1920-01-01', 'Rua do Mar', 'SALVADOR', 'BA', '33333333333');

# POVOANDO TABELAS CURSOS
INSERT INTO cursos VALUES
(DEFAULT, "Codeigniter"),
(DEFAULT, "Python"),
(DEFAULT, "MySQL");

# POVOANDO TABELAS alunos_cursos
INSERT INTO alunos_cursos VALUES
(DEFAULT, 1, 1), # Pedro (id_aluno = 1) esta inscrito em Codeigniter (id_curso = 1)
(DEFAULT, 1, 2), # Pedro (id_aluno = 1) esta inscrito em Python (id_curso = 2)
(DEFAULT, 2, 1), # Diego (id_aluno = 2) esta inscrito em Codeigniter (id_curso = 1)
(DEFAULT, 2, 3), # Diego (id_aluno = 1) esta inscrito em Mysql (id_curso = 3)
(DEFAULT, 3, 1), # Fliper (id_aluno = 3) esta inscrito em Codeigniter (id_curso = 1)
(DEFAULT, 3, 2), # Fliper (id_aluno = 3) esta inscrito em Python (id_curso = 2)
(DEFAULT, 4, 1), # Ricardo (id_aluno = 1) esta inscrito em Codeigniter (id_curso = 1)
(DEFAULT, 5, 1); # Regina (id_aluno = 1) esta inscrito em Codeigniter (id_curso = 1)

# POVOANDO TABELAS notas
INSERT INTO
notas VALUES
(DEFAULT, 1, 'Prova 1', 28.0), # Pedro fez a atividade Prova 1 no Codeigniter e tirou 28.0
(DEFAULT, 1, 'Prova 2', 25.0), # Pedro fez a atividade Prova 2 no Codeigniter e tirou 25.0
(DEFAULT, 2, 'Prova 2', 20.0), # Pedro fez a atividade Prova 2 no Python e tirou 20.0
(DEFAULT, 2, 'Prova 2', 20.0), # Pedro fez a atividade Exercício 2 no Python e tirou 10.0
(DEFAULT, 3, 'Prova 1', 25.0), # Diego fez a atividade Prova 1 no Codeigniter e tirou 25.0
(DEFAULT, 5, 'Prova 1', 28.0), # Fliper fez a atividade Prova 1 no Codeigniter e tirou 28.0
(DEFAULT, 6, 'Exercicio 2', 12.0); # Fliper fez a atividade Exercicio 2 no Python e tirou 12.0

SELECT * FROM alunos;
SELECT * FROM alunos_cursos;
SELECT * FROM cursos;
SELECT * FROM notas;

SELECT A.nome, C.nome, N.descricao_atividade, N.vlr_nota
FROM alunos A, cursos C, alunos_cursos AC, notas N
WHERE A.id_aluno = AC.id_aluno and c.id_curso = AC.id_curso and AC.id_aluno_curso = N.id_aluno_curso
