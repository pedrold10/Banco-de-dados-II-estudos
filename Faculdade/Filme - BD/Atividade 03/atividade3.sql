--1.1.   O que a seguinte consulta apresenta/mostra (0,5)?
select f.titulo
from filme f
where f.codest in (select e.codest
                   from estudio e
                   where nomeest like 'P%');
		-- Retorna os titulos dos filmes cujo nomeest é "Paramount"
		
--1.2.   Mostre as descrições de categorias que estão na tabela Filme (associadas a filmes) (0,5).

select f.titulo, c.desccateg 
from filme f 
join categoria c 
on(c.codcateg=f.codcateg)

--1.3.   Qual o nome do artista cujo nome de personagem é ‘Natalie’ (1,0)?  
select a.nomeart, p.nomepers
from artista a
join personagem p
on(p.codart=a.codart)
where p.nomepers = 'Natalie'

--1.4.   Existe algum artista cadastrado que não esteja na tabela Personagem (1,0)?
select a.nomeart
from artista a
where a.codart not in (select p.codart
                   from personagem p);
				   --R. Sim, Rodrigo Santoro 
--2.      Crie uma tabela filmeEst (use create table as) que mostre os filmes (títulos) e seus estúdios 
-- 		  (nomes) associados. Use um JOIN para isso. Consulte a tabela criada e mostre seus dados (1,0).

create table filmeEst as 
select f.titulo, e.nomeest
from filme f
join estudio e 
on(e.codest=f.codest);-- Criação da tabela

select * from filmeEst; -- Consultando a tabela

--3.      Verifique o seguinte comando (1,5):
select a.nomeart
from artista a 
where a.codart in (select p.codart
                  from personagem p
                  where p.codfilme in (select f.codfilme
                                     from filme f
                                     where f.duracao > 120))
/*O que o comando retorna? --R. Artistas que são personagens em filmes com duração maior que 120 minutos
Reescreva-o usando JOIN.
Os resultados das consultas com subconsulta e com JOIN são semelhantes? Explique. R. São semelhantes, porém a ordem de exibição é alterada
*/
select a.nomeart
from artista a
join personagem p
on(a.codart=p.codart)
join filme f
on(p.codfilme=f.codfilme)
where f.duracao>120

--4.      Verifique o comando seguinte (1,5):
select a.codart
from artista a
where pais = ‘USA’
   INTERSECT
select p.codart
from personagem p;
/* O que o comando retorna?
Refaça-o usando uma subquery.
Depois, refaça-o usando JOIN.
Compare os resultados e explique-os.*/
