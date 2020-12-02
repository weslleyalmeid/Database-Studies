-- AULA 5 Criação de um Banco de Dados
-- Criar banco de dados
create database db_biblioteca;

-- visualizar bases de dados
show databases;

-- selecionar o banco
use db_biblioteca;

-- mostrar qual banco de dados está sendo utilizado no momento
select database();

-- excluir banco de dados
drop database if exists db_biblioteca;

-- mostrar tabelas existentes
show tables;

-- AULA 6 Constraints (Restrições) Primary Key, FK, Default
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- DEFAULT

--  AULA 7 Criação de Tabelas - CREATE TABLE
-- criar tabelas
create table if not exists tbl_livro (
	id_livro smallint auto_increment primary key,
    nome_livro varchar(50) not null,
    isbn varchar(30) not null,
    id_autor smallint not null,
    data_pub date not null,
    preco_livro decimal not null
);

create table tbl_autores (
	id_autor smallint primary key,
    nome_autor varchar(50),
    sobrenome_autor varchar(60)
);

create table tbl_editoras (
	id_editora smallint primary key auto_increment,
    nome_editora varchar(50) not null
);

-- AULA 8 - Auto Incremento de valores em colunas
CREATE TABLE tbl_teste_incremento (
Codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 90;

show tables;

INSERT INTO tbl_teste_incremento (Nome) VALUES ('Ana');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Maria');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Julia');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Joana');

INSERT INTO tbl_teste_incremento (Nome) VALUES ('Rubens');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Jose');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Romeu');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Dark');
SELECT * FROM tbl_teste_incremento;

-- Verificar o valor do último incremento
select max(Codigo) 
from tbl_teste_incremento;

-- Alterar o valor do Auto incremento
alter table tbl_teste_incremento
auto_increment = 90;

INSERT INTO tbl_teste_incremento (Nome) VALUES ('Rubens');

drop table tbl_teste_incremento;

-- AULA 9 -Tipos de Dados comuns
-- AULA 10 - Alterar Tabelas – comando ALTER TABLE
use db_biblioteca;

alter table tbl_livro
drop column id_autor;

alter table tbl_livro
add id_autor smallint not null;

alter table tbl_livro
add constraint fk_id_autor
foreign key(id_autor)
references tbl_autores(id_autor);

alter table tbl_livro
add id_editora smallint not null;

alter table tbl_livro
add constraint fk_id_editora
foreign key(id_editora)
references tbl_editoras(id_editora);

select * from tbl_livro;

-- como enxergar o relacionamentos entre as tabelas
-- Criar model com base nos dados e selecionar a base de dados
-- Aula 11 - Inserir dados em Tabelas
insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values(1, 'Daniel', 'Barret');
insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values(2, 'Gerald', 'Carter');
insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values(3, 'Mark', 'Sobell');
insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values(4, 'William', 'Stanek');
insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values(5, 'Richard', 'Blum');

select * from tbl_autores;

insert into tbl_editoras(nome_editora)
values 
('Prentice Hall'),
('O`Reilly'),
('Microsoft Press'),
('Wiley');

select * from tbl_editoras;

INSERT INTO tbl_livro(nome_livro, isbn, data_pub, preco_livro, id_autor, id_editora)
VALUES
('Linux Command Line and Shell Scripting',143856969, '20091221', 68.35, 5, 4),
('SSH, the Secure Shell', 127658789, '20091221', 58.30, 1, 2),
('Using Samba', 123856789, '20091221', 61.45, 2, 2),
('Fedora and Red Hat Linux', 9780133477436, '20140110', 62.24, 3, 1),
('Windows Server 2012 Inside Out',9780735666313, '20130125', 66.80, 4, 3),
('Microsoft Exchange Server 2010',9780735640610, '20101201', 45.30, 4, 3);

select * from tbl_livro;
truncate table tbl_livro;

-- AULA 12 - Consultas simples em tabelas
use db_biblioteca;
select * from tbl_livro;
select nome_autor from tbl_autores;
select * from tbl_autores;
select nome_livro from tbl_livro;

select nome_livro, id_autor from tbl_livro;
select nome_livro, isbn from tbl_livro;

-- AULA 13 -  ORDER BY - realizar consultas com ordenação
-- ASC = ordem ascendente e DESC = ordem descendente
select * from tbl_livro
order by nome_livro asc;

select nome_livro, id_editora from tbl_livro
order by id_editora;

select nome_livro, preco_livro from tbl_livro
order by preco_livro desc;

-- AULA 14 - WHERE -filtrar registros em uma consulta
-- select coluna from tabala where coluna = valor;
select nome_livro, data_pub from tbl_livro
where id_autor = 1;

select id_autor, nome_autor from tbl_autores
where sobrenome_autor = 'Stanek';

-- AULA 15 - operadores AND, OR e NOT
show databases;
use db_biblioteca;
select database();

select * from tbl_livro
where id_livro > 2 and id_autor < 3;

select * from tbl_livro
where id_livro > 2 or id_autor < 3;

select * from tbl_livro
where id_livro > 2 and not id_autor < 3;

-- AULA 16 - DELETE e TRUNCATE TABLE - excluir registro da tabela;
select * from tbl_teste_incremento;
-- apaga um conteudo da tabela
delete from tbl_teste_incremento
where Codigo = 15;
-- apaga os dados da tabela inteiro
truncate table tbl_teste_incremento;

-- AULA 17 - SQL Alias
select nome_livro
as livro
from tbl_livro;

select nome_livro as livro, preco_livro as preco
from tbl_livro;

-- AULA 18 - função de agragação (max, min, avg, count e sum)
-- Count = Contar quantidade de itens
select count(*) from tbl_autores;
select count(distinct id_autor) from tbl_livro;
-- sum = total(soma)
select sum(preco_livro) from tbl_livro;
-- avg = media aritmetica
select avg(preco_livro) from tbl_livro;
-- max = valor maximo
select max(preco_livro) from tbl_livro;
-- min = valor minimo
select min(preco_livro) from tbl_livro;

-- AULA 19 - renomeartabela com RENAME TABLE
show databases; #mostrar todas as bases de dados
use db_biblioteca; # selecionar a tabela que quero usar
select database(); # mostrar tabela selecionada

create table cliente(
	id_cliente smallint,
    nome_cliente varchar(20),
    constraint primary key(id_cliente)
);

rename table cliente to meus_clientes;
drop table meus_clientes;
show tables;

-- AULA 20 - UPDATE - modificar registro
/* 	update tabela
	set coluna = novo_valor_armazenado
	where coluna = valor_filtro; 
*/
update tbl_livro
set nome_livro = 'SSH, o shel seguro'
where id_livro = 2;

select * from tbl_livro;

-- AULA 21 - BETWEEN - seleção de intervalos
/* 
	SELECT colunas FROM tabela
    WHERE coluna BETWEEN valo1 AND valor2;
*/
select * from tbl_livro
where data_pub between '20040517' and '20110517';

select nome_livro as livro, preco_livro as preco from tbl_livro
where preco_livro between 40.00 and 60.00;

-- AULA 22 - LIKE  e NOT LIKE - padrões de caracter em consultas 
select * from tbl_livro
where nome_livro like 'F%';

select * from tbl_livro
where nome_livro not like 'S%';

select nome_livro
from tbl_livro
where nome_livro like '_i%';
-- o _ informa que tem que ser um caracter qualquer e a segunda letra
-- seja letra 'i' e não importa as letras após

-- AULA 23 - REGEXP - Expressões regulares em consultas
select nome_livro from tbl_livro
where nome_livro regexp '^[FS]';

select nome_livro from tbl_livro
where nome_livro regexp '^[^FS]';

-- AULA 24 - DEFAULT - COLOCAR nomes ou valores padrões
/* 	alter table nome_tablea
	modify column nome_coluna tipo_dados
    default 'valor_padrão';
    */
use db_biblioteca;
alter table tbl_autores
modify column sobrenome_autor varchar(60)
default 'da Silva';

insert into tbl_autores(id_autor, nome_autor)
values (10, 'João');

insert into tbl_autores(id_autor, nome_autor, sobrenome_autor)
values (7, 'Rita', 'Judite');

select * from tbl_autores;
-- Para setar caso queira desativar o default, tira o default
alter table tbl_autores
modify column sobrenome_autor varchar(60);
