# ctrl + enter = para executars
# primeiro foi criado a base de dados chamada filmes
CREATE database filmes;

# após criamos as tabelas da base
create table filmes(
	id_filme int auto_increment primary key,
    filme varchar(255),
    genero varchar(255),
    nota_especialistas int,
    nota_audiencia int,
    custo int, 
    ano int
);

#Aqui vc especifica o local do arquivo
LOAD DATA LOCAL INFILE '/home/weslley/Área de Trabalho/LINGUAGENS/BANCO DE DADOS E MYSQL/filmes.csv'
INTO TABLE filmes          #Aqui você especifica o nome da tabela
FIELDS TERMINATED BY ','   #Aqui será o tipo de separador 
ENCLOSED BY '"' # Palavras entre "" tem que esperar ser fechada
LINES TERMINATED BY '\n'   #Aqui é a quebra de cada linha por inserts
IGNORE 1 ROWS # Ignore a primeira linha se tiver o cabeçalho
# Aqui você coloca os campos na mesma sequencia das células do arquivo.csv
(filme, genero, nota_especialistas, nota_audiencia, custo, ano);

select * from filmes;

# RESPONDENDO PERGUNTAS - CRITICAS DE FILMES DOS ANOS ENTRE 2007 A 2011
#1. Quais são os 10 filmes mais apreciados pelo público?
select * from filmes order by nota_audiencia desc limit 10;

#2. Quais são os 10 filmes mais apreciados pela crítica especializada?
select * from filmes order by nota_especialistas desc limit 10;

#3. Quais são os 10 filmes mais odiados pelo público?
select * from filmes order by nota_audiencia limit 10;

#4. Quais são os 10 filmes mais odiados pela crítica especializada?
select * from filmes order by nota_especialistas limit 10;

#5. Qual filme com maior custo e qual filme com menor custo?
select * from filmes order by custo limit 1; #menor custo
select * from filmes order by custo desc limit 1; # maior custo
select * from filmes where custo = (select max(custo) from filmes);
select * from filmes where custo = (select min(custo) from filmes);

#6. Qual a média da nota da crítica especializada?
select avg(nota_especialistas) from filmes;

#7. Qual a média da nota do público? avg faz a média
select avg(nota_audiencia) as 'Média audiência' from filmes;

#8. Qual a média de custo de filmes?
select avg(custo) from filmes;

#9. Quantos filmes custaram mais do que o custo médio dos filmes da tabela?
select * from filmes where custo > (select avg(custo) from filmes) order by custo desc;
select count(*) from filmes where custo > (select avg(custo) from filmes);

#10. Quais são os filmes com nota acima da média das notas dadas pela crítica especializada?
select * from filmes where nota_especialistas > (select avg(nota_especialistas) from filmes) order by nota_especialistas desc;

#11. Quais são os filmes com nota acima da média das notas dadas pelo público? Quais os melhores?
select * from filmes where nota_audiencia > (select avg(nota_audiencia) from filmes) order by nota_audiencia desc;

#12. Quais são os tipos de categoria (gêneros) existentes?
select genero from filmes group by genero;

#13. Quais são os gêneros com maior quantidade de filmes?
select genero, count(genero) as total from filmes group by genero order by total desc;

#14. Qual gênero tem a mais alta média de custo?
select avg(custo) as 'Comedy' from filmes where genero = 'Comedy';
select avg(custo) as 'Action' from filmes where genero = 'Action';
select avg(custo) as 'Drama' from filmes where genero = 'Drama';
select avg(custo) as 'Horror' from filmes where genero = 'Horror';
select avg(custo) as 'Thriller' from filmes where genero = 'Thriller';
select avg(custo) as 'Adventure' from filmes where genero = 'Adventure';
select avg(custo) as 'Romance' from filmes where genero = 'Romance';

select * from filmes where genero = 'Action' order by custo desc;

#15. Qual gênero tem a mais alta média de nota para o público?
select avg(nota_audiencia) as 'Comedy' from filmes where genero = 'Comedy';
select avg(nota_audiencia) as 'Action' from filmes where genero = 'Action';
select avg(nota_audiencia) as 'Drama' from filmes where genero = 'Drama';
select avg(nota_audiencia) as 'Horror' from filmes where genero = 'Horror';
select avg(nota_audiencia) as 'Thriller' from filmes where genero = 'Thriller';
select avg(nota_audiencia) as 'Adventure' from filmes where genero = 'Adventure';
select avg(nota_audiencia) as 'Romance' from filmes where genero = 'Romance';

select * from filmes where genero = 'Thriller' order by custo desc;

#16. Qual gênero tem a mais alta média de nota para a crítica especializada?
select avg(nota_especialistas) as 'Comedy' from filmes where genero = 'Comedy';
select avg(nota_especialistas) as 'Action' from filmes where genero = 'Action';
select avg(nota_especialistas) as 'Drama' from filmes where genero = 'Drama';
select avg(nota_especialistas) as 'Horror' from filmes where genero = 'Horror';
select avg(nota_especialistas) as 'Thriller' from filmes where genero = 'Thriller';
select avg(nota_especialistas) as 'Adventure' from filmes where genero = 'Adventure';
select avg(nota_especialistas) as 'Romance' from filmes where genero = 'Romance';

select * from filmes where genero = 'Thriller' order by custo desc;

#17. Quantos filmes foram produzidos por ano?
select ano from filmes group by ano;
select ano, count(ano) from filmes group by ano order by ano desc;

#18. Qual ano foram produzidos mais filmes?
select ano, count(ano) as total from filmes group by ano order by total desc limit 1;

#19. Qual gênero produziu mais filmes em um ano?
select count(ano) as total, ano, genero from filmes group by ano, genero order by total desc;

#20. Qual o filme mais amado pela audiência e pelos especialistas ao mesmo tempo? 
select * from filmes order by nota_audiencia desc limit 3; 
select * from filmes order by nota_especialistas desc limit 3;

select filme, (nota_especialistas + nota_audiencia)/2 as `Nota média` from filmes order by `Nota média` desc limit 3