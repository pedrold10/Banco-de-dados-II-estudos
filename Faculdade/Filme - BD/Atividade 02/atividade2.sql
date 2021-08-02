--1.      Faça inicialmente a seguinte inserção:
		insert into filme values(default,'Superman',120,2018,null,3);
--2.      Verifique quais os títulos dos filmes que possuem duração maior que 120 min (0,5)?
select titulo, duracao from filme where duracao>120;

--3.      Na tabela ARTISTA, quais artistas possuem cidade nula? Após a consulta, atualize as cidades nulas 
--		  encontradas para três artistas (0,5).
select nomeart, cidade from artista;

update artista
set cidade = 'San Diego'   where nomeart = 'Cameron Diaz';
update artista
set cidade = 'Smyrna' 	   where nomeart = 'Julia Roberts';
update artista
set cidade = 'Shawnee' 	   where nomeart = 'Brad Pitt';
update artista
set cidade = 'Syracuse'    where nomeart = 'Tom Cruise';
update artista
set cidade = 'Filadélfia'  where nomeart = 'Bradley Cooper';
update artista
set cidade = 'San Juan'  where nomeart = 'Joaquin Phoenix';

--4.      Qual a descrição da categoria do filme ‘Coringa’ (1,0)?

select desccateg from filme f join categoria ca on(ca.codcateg = f.codcateg) where titulo = 'Coringa';

--5.      Mostre os títulos de filmes, seus estúdios e suas categorias (1,0).

select titulo, nomeest, desccateg from filme f 
join estudio e on (f.codest = e.codest)
join categoria ca on(f.codcateg = ca.codcateg);

--6.      Qual o nome dos artistas que fizeram o filme ‘Encontro Explosivo’ (1,0)?

select titulo, nomepers from filme f 
join personagem p on (f.codfilme=p.codfilme)
join artista a on (a.codart = p.codart)
where titulo = 'Encontro Explosivo';

--7.      Selecione os artistas que tem o nome iniciando com a letra ‘B’ e 
--		  participaram de filmes da categoria ‘Aventura’ (1,0).

select nomeart, desccateg from filme f 
join personagem p on(f.codfilme = p.codfilme)
join artista a on (a.codart = p.codart)
join categoria c on (f.codcateg = c.codcateg)
where nomeart like 'B%' and
desccateg = 'Aventura';

--8.      Apresente quantos filmes existem por categoria. Para isso mostre a descrição da categoria 
--		  e sua respectiva contagem (1,0).
select desccateg as Categoria, count(c.codcateg) as filmes from filme f 
join categoria c on (c.codcateg=f.codcateg) Group By desccateg;

-- 9.      Altere a questão anterior acrescentando a cláusula “having”. 
--		   Explique o que a consulta retorna no contexto que você implementou (1,0)

select desccateg as Categoria, count(c.codcateg) as filmes from filme f 
join categoria c on (c.codcateg=f.codcateg) Group By desccateg
having desccateg like 'A%'; --R. Retornou as categorias Ação e Aventura, e suas respectivas quantidades

-- 10.  O que o seguinte comando mostra (1,0)?

select a.nomeart, p.nomepers
from artista a left outer join personagem p on a.codart = p.codart; --R. Artistas e seus respectivos personagens

--11.  O que a seguinte consulta retorna (1,0)?

Select f.titulo as Filme, c.desccateg as Categoria
From filme f  right join categoria c on (f.codcateg = c.codcateg)
Where c.codcateg is null; -- R. Os filmes e suas respectivas categorias, em casos que as mesmas sejam nulas
 

-- 12.         Crie uma consulta sua ao banco Filmes. Use operadores SQL e algum tipo de JOIN. 
--			   Formule o enunciado da consulta e mostre sua solução (1,0). 

-- Listando artistas e seus respectivos filmes onde participaram

select nomeart as artista, titulo as artista, nomepers as personagem  
from artista a
join personagem p on (p.codart=a.codart)
join filme f on (f.codfilme = p.codfilme);


