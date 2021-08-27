--6.   Considerando isso, teste o seguinte comando (0,5):
		Explain select * from empregado
		where salario > 4000;
 --		a)   Qual o custo dessa consulta? 
 			-- cost= 0.00..14.25
 --     b)  Quantos registros serão obtidos? 
 			-- rows= 113
 --     c)  Execute efetivamente a consulta e informe seu tempo de resposta. 
 			-- tempo: 149 msec
-- 7. Quando o planejador de consultas monta o plano de execução da consulta, 
-- ele pode fazer uso de índices, caso existam. Efetue os testes seguintes (2,0).
		create table testaEMP as select * from empregado;
		select * from testaEMP;
		
-- execute o bloco anônimo em PgPLSQL seguinte completo (do DO até o $$;) e não linha a linha
			DO $$DECLARE i int:= 0;
			BEGIN
				WHILE I <= 100000 LOOP
						 INSERT INTO testaEMP select * from empregado;
						 I := I + 1;
				END LOOP;
			END$$;
--Verifique a consulta e seu explain: 
			Select primeironome from testaEmp where gerente = 2;
			EXPLAIN Select primeironome from testaEmp where gerente = 2;
--- Crie um índice 
			create index testaEmpindex on testaEmp(gerente);

-- Verifique a consulta e seu explain: 
			Select primeironome from testaEmp where gerente = 2;
			EXPLAIN Select primeironome from testaEmp where gerente = 2;
 --a) Compare os resultados e explique o que aconteceu. 
 -- Houve melhora no tempo de resposta da consulta com o índice? O índice foi usado? 
 
 	 /*Houve uma melhora no desempenho, fazendo um comparativo temos:
	
		 Sem indice:
		
			 Bitmap Heap Scan on testaemp  (cost=2261.21..11688.51 rows=202424 width=7)
			
		 Com indice:
		
			   ->  Bitmap Index Scan on testaempindex  (cost=0.00..2210.61 rows=202424 width=0)
	 */
	 
--** Verifique os seguintes comandos e informe a quantidade de páginas 
-- de disco ocupadas pelas tabelas EMPREGADO e TESTAEMP:

select relpages from pg_class where relname = 'empregado'; -- 0
select relpages from pg_class where relname = 'testaemp'; -- 6897
select * from empregado;

-- 8.   Quais índices existem para a tabela EMPREGADO?

	SELECT * FROM pg_indexes WHERE tablename = 'empregado'; -- a consulta não retorna nenhum indice
-- Qual outro índice poderia ser criado para essa tabela? 

	-- Não seria necessário criar um indice
	
-- Qual a justificativa para sua criação (1,0)?

	-- Por conta do tamanho da tabela, e por ela poder ser atualizada com uma grande frequencia
	
-- 9. Explique a frase: “os índices são estruturas que organizam referências à 
-- localização dos dados reais das tabelas” (0,5).

	-- A frase diz que o indice é feito para um determinado assunto que se refere o dado, e separa e localiza 
	-- os dados que atendem devidamente ao assunto criado pelo desenvolvedor
	
--10. Execute os comandos seguintes (passo a passo):
 -- Deixe o auto commit e auto rollback desativados
Begin;
	Create table testeTransacao (coluna1 serial,coluna2 varchar(10));
	Alter table testeTransacao add constraint pk_t primary key(coluna1);
	Commit;
 
Begin;
	Insert into testeTransacao values (default,'AAA');
	Insert into testeTransacao values (default,'ABC');
	Insert into testeTransacao values (default,'BBB');
	Insert into testeTransacao values (default,'BCD');
	Insert into testeTransacao values (default,'CCC');
	Insert into testeTransacao values (default,'CDE');
	Select * from testeTransacao;
	savepoint spt1;
	Insert into testeTransacao values (default,'DDD');
	Insert into testeTransacao values (default,'DEF');
	Insert into testeTransacao values (default,'EEE');
	Select * from testeTransacao;


--Em seguida, responda (1,0):
--a.       Quantos registros existem na tabela TesteTransacao ?
	-- 9 registros
--b.      Faça um rollback para spt1.
		Rollback to spt1;
-- c.       Quantos registros existem na tabela TesteTransacao agora?
	-- 6 registros
	
-- Execute agora a 2a parte (2,0):
Insert into testeTransacao values (default,'EFG');
Insert into testeTransacao values (default,'FFF');
Insert into testeTransacao values (default,'FGH');
Select * from testeTransacao;
 
-- d.      Quantos registros têm agora na tabela testeTransação?
	-- 9 registros
-- e.       Faça um rollback (geral: Rollback;). O que aconteceu? Explique.
	rollback;
	-- A tabela ficou vazia
--f.        Quantas transações ocorreram nesse exemplo?
	-- Ocorreram 12 transações que foram revertidas com o rollback
--g.      Insira 6 registros.
	Insert into testeTransacao values (default,'AAA');
	Insert into testeTransacao values (default,'ABC');
	Insert into testeTransacao values (default,'BBB');
	Insert into testeTransacao values (default,'BCD');
	Insert into testeTransacao values (default,'CCC');
	Insert into testeTransacao values (default,'CDE');
-- h.      Faça commit.
	commit;
-- i.       O que o commit fez? Explique.
	-- Finalizou a transação com sucesso, tornando as alterações realizadas pela transação persistentes



