-- questão 2
CREATE DATABASE FILMES;
-- questão 3
CREATE TABLE Artista(
	codArt serial primary key,
	nomeArt varchar(25),
	cidade varchar(20),
	pais varchar(20),
	dataNasc date
);
drop table artista cascade;

SELECT * FROM ARTISTA;

CREATE TABLE PERSONAGEM(
	nomePers varchar(25),
	cache numeric(15,2),
	codFilme integer,
	codArt integer,
	constraint fk_codFilme foreign key (codFilme) references filme (codFilme),
	constraint fk_codArt foreign key (codArt) references artista (codArt)
)
drop table personagem cascade;
create table filme(
	codFilme serial primary key,
	titulo varchar(25),
	duracao integer,
	ano integer,
	codEst integer,
	codCateg integer,
	constraint fk_codEst foreign key (codEst) references estudio (codEst),
	constraint fk_codCateg foreign key (codCateg) references categoria (codCateg)
);
create table estudio(
	codEst serial primary key,
	nomeEst varchar(25)
);
create table categoria(
	codCateg serial primary key,
	descCateg varchar(25)
);

-- questão 5
	-- inserindo em artista
insert into artista values(default,'Cameron Diaz',null,'USA','15/07/75');
insert into artista values(default,'Julia Roberts',null,'USA','20/08/67');
insert into artista values(default,'Brad Pitt',null,null,'05/03/70');
insert into artista values(default,'Joaquin Phoenix',null,null,'06/04/72');
insert into artista values(default,'Bradley Cooper',null,'USA','06/06/77');
insert into artista values(default,'Tom Cruise',null,'USA','10/09/64');
insert into artista values(default,'Rodrigo Santoro','Rio de Janeiro','Brasil','12/10/78');

	-- inserindo em estudio
insert into estudio values(default,'Paramount');
insert into estudio values(default,'Disney');
insert into estudio values(default,'Universal');

	--  inserindo em personagem
	
insert into personagem values('Natalie',10000,1,1);
insert into personagem values('Tom',10000,1,2);
insert into personagem values('John',10000,5,3);
insert into personagem values('Ana',6000,3,2);
insert into personagem values('Tom',11000,6,5);
insert into personagem values('John',12000,4,4);

	-- inserindo em categoria
	
insert into categoria values(default,'Aventura');
insert into categoria values(default,'Romance');
insert into categoria values(default,'Comédia');
insert into categoria values(default,'Ação');
insert into categoria values(default,'Suspense');
insert into categoria values(default,'Drama');

	-- inserindo em filme
	
insert into filme values(default,'Encontro Explosivo',134,2010,4,1);
insert into filme values(default,'O Besouro Verde',155,2010,1,1);
insert into filme values(default,'Comer, Rezar, Amar',177,2010,2,1);
insert into filme values(default,'Coringa',122,2019,6,1);
insert into filme values(default,'Era uma vez em Hollywood',119,2020,4,2);
insert into filme values(default,'Nasce uma estrela',100,2018,6,1);

-- questão 6

select * from artista;
select * from estudio;
select * from personagem;
select * from categoria;
select * from filme;

-- questão 7

	-- inserindo em artista
	
insert into artista values(default,'Daniel Radcliffe','Londres','Reino Unido','23/07/89');
insert into artista values(default,'Emma Watson','Paris','França','15/04/90');
insert into artista values(default,'Tom Felton','Epsom','Reino Unido','22/09/87');
insert into artista values(default,'Gabriel Macht','Nova Iorque',null,'22/01/72');

	-- inserindo em estudio
insert into estudio values(default,'Projac');
insert into estudio values(default,'21st Century Fox.');
insert into estudio values(default,'Lions Gate Entertainment');
insert into estudio values(default,'WarnerMedia');
	-- inserindo em categoria
	
insert into categoria values(default,'Terror');
insert into categoria values(default,'Documentário');
insert into categoria values(default,'Religioso');
	-- inserindo em filme
	
insert into filme values(default,'Harry Potter',159,2001,7,1);
insert into filme values(default,'Vingadores Ultimato',182,2019,2,4);
insert into filme values(default,'Rogai por Nós',99,2021,2,7);

	--  inserindo em personagem
	
insert into personagem values('Harry',50000,7,11);
insert into personagem values('Hermione',10000,7,12);
insert into personagem values('Draco',10000,7,13);

-- questão 8

select * from artista order by nomeArt;

	-- Não estão inseridos em ordem alfabética, uma vez que a numeração na tabela é por ordem de inserção
	
-- questão 9 

select nomeArt from artista where nomeArt like 'B%';

-- questão 10

select * from filme where ano = 2019;

-- questão 11

update personagem
	set cache=cache*1.15
	
-- questão 12 
update artista 
	set pais = 'EUA'
	where nomeArt = 'Gabriel Macht'
	
update artista 
	set pais = 'Porto Rico', cidade = 'San Juan'
	where nomeArt = 'Joaquin Phoenix'
	
update artista 
	set pais = 'EUA'
	where nomeArt = 'Brad Pitt'
	
-- questão 13

insert into artista values(default,'Carla Diaz','São Paulo','Brasil','28/08/90');
insert into artista values(default,'Monique Alfradique','Niterói','Brasil','29/04/86');
insert into artista values(default,'Sérgio Marone','São Paulo','Brasil','04/02/81');

-- questão 14

delete from artista where nomeArt = 'Emma Watson';
