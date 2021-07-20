create table aluno(
	MatricAlu	serial NOT NULL,
	NomeAlu		VARCHAR(40),
	DataAniver	DATE default '01/01/1998',
	Sexo		CHAR(1),
	CONSTRAINT PKAluno PRIMARY KEY(MatricAlu)
);

create table disciplina(
	CoDISC		serial NOT null,
	NomeDISC 	VARCHAR(30),
	CONSTRAINT PKDisciplina PRIMARY KEY(CoDISC)
);

-- Nesta tabela, vamos criar a coinstraint de PK utilizando o alter table


create table professor(
	MatricProf		serial 		NOT null,
	NomeProf		VARCHAR(40),
	DataAdmissao 	DATE
);

ALTER TABLE Professor ADD CONSTRAINT PKprofessor PRIMARY KEY(MatricProf);