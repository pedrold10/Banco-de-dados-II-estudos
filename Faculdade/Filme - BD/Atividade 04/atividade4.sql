/*1.   Para a tabela artista, crie uma view artistaV com os seguintes campos: 
codart, nomeart, datanasc. Renomeie “codart” para “código do artista” e 
“nomeart” para “nome” na view. Liste o conteúdo da view criada (0,5).
*/

create view artistaV(codigo_do_artista, nomeart) as select codart, nomeart, datanasc from artista;
select * from artistaV;

/*2.   Crie uma view filmeV com os seguintes campos: titulo,duração, ano, 
estúdio (nome do estúdio). Liste, em seguida, seu conteúdo (0,5).
*/
create view filmeV(
	titulo, 
	duracao, 
	ano, 
	estudio
) as select
	titulo, 
	ano, 
	duracao 
  from filme f
  join estudio e
  on (f.codest = e.codest);
  


select * from filmev;
select * from filme;

/*3.    Faça a inserção da artista “Mariana Ximenes” com a data de nascimento 
‘27/11/78’ através da view artistaV. Como foi possível inserir por meio da view? Explique (0,5).
*/

--4.     Tente inserir um filme através da view filmeV. O que aconteceu? Explique (0,7).


/*a.  Faça a inserção através da tabela base filme. Depois consulte a view. O filme foi inserido? 
Consulte também a tabela base (0,3).
*/


/*5.    Crie uma view que mostre os nomes dos artistas dos filmes que são do ano de 2019. 
Consulte a view criada (0,5).
*/