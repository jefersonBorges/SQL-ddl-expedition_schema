/*
Exercício - Ajuste
Ajustar as tabelas PECA - FORNECEDOR - EXPEDICAO de acordo com os detalhes abaixo:
1- Adicionar o atributo data com o tipo adequado na tabela expedição
2 - Preencher valores para as datas dos registros já existentes na tabela expedição
3 - Transformar a chave primária da tabela expedição em uma chave composta com os atributos codp, cods e data
4 - Adicionar um atributo denominado foto na tabela PECA que permitirá os registrosde valores binários, ou seja, o binário da foto da peça.
*/
set search_path = 'exercicio';
drop table IF EXISTS expedicao;
drop table IF EXISTS peca;
drop table IF EXISTS fornecedor;

CREATE TABLE peca (
  CODP varchar(5) NOT NULL,
  PNAME varchar(30) NOT NULL,
  COLOR varchar(20),
  WEIGHT int,
  CITY varchar(30) DEFAULT 'London',
  PRIMARY KEY (CODP),
  UNIQUE (PNAME),
  CHECK (COLOR IN ('Red','Blue','Green')),
  CHECK (WEIGHT > 0)
);

/*
Table structure for table 'fornecedor'
*/

CREATE TABLE fornecedor (
  CODS varchar(5) NOT NULL,
  SNAME varchar(30) NOT NULL,
  STATUS smallint NOT NULL,
  CITY varchar(30),
  PRIMARY KEY (CODS),
  UNIQUE (SNAME)
);

/*
Table structure for table 'expedicao'
*/

CREATE TABLE expedicao (
  CODS varchar(5) NOT NULL,
  CODP varchar(5) NOT NULL,
  QTY int NOT NULL,
  PRIMARY KEY (CODS,CODP),
  CHECK (QTY > 0),
  FOREIGN KEY (CODS) REFERENCES fornecedor(CODS),
  FOREIGN KEY (CODP) REFERENCES peca(CODP)
);

/*
Carregando(dumping) na tabela 'peca'
*/
INSERT INTO peca VALUES('P1','Nut','Red',12,'London');
INSERT INTO peca VALUES('P2','Bolt','Green',17,'Paris');
INSERT INTO peca VALUES('P3','Screw','Blue',17,'Rome');
INSERT INTO peca VALUES('P4','Hammer','Red',14);
INSERT INTO peca VALUES('P5','Cam','Blue',12,'Paris');
INSERT INTO peca VALUES('P6','Cog','Red',19,'London');

/*
Carregando(dumping) dados na tabela 'fornecedor'
*/
INSERT INTO fornecedor VALUES('S1','Smith',20,'London');
INSERT INTO fornecedor VALUES('S2','Jones',10,'Paris');
INSERT INTO fornecedor VALUES('S3','Blake',30,'Paris');
INSERT INTO fornecedor VALUES('S4','Clark',20,'London');
INSERT INTO fornecedor VALUES('S5','Adams',30,'Athens');

/*
Dumping data for table 'expedicao'
*/
INSERT INTO expedicao VALUES('S1','P1',300);
INSERT INTO expedicao VALUES('S1','P2',200);
INSERT INTO expedicao VALUES('S1','P3',400);
INSERT INTO expedicao VALUES('S1','P4',200);
INSERT INTO expedicao VALUES('S1','P5',100);
INSERT INTO expedicao VALUES('S1','P6',100);
INSERT INTO expedicao VALUES('S2','P1',300);
INSERT INTO expedicao VALUES('S2','P2',400);
INSERT INTO expedicao VALUES('S3','P2',200);
INSERT INTO expedicao VALUES('S4','P2',200);
INSERT INTO expedicao VALUES('S4','P4',300);
INSERT INTO expedicao VALUES('S4','P5',400);

--adicionando a coluna data


/* opcao
update expedicao
set data = to_timestamp ('01 Jan 2021 14:20:35', 'DD Mon YYYY HH24:MI:SS')
where cods = 'S1);
*/
alter table expedicao
	add	data timestamp;


select*from expedicao;

update expedicao
	set data = current_date
	where cods = 'S1';
	
update expedicao
	set data = current_date
	where cods = 'S2';
	
update expedicao
	set data = current_date
	where cods = 'S3';
	
update expedicao
	set data = current_date
	where cods = 'S4';
	
--desfazendo a alteração:	
select*from expedicao
where data = null;

update expedicao
	set data = null;
	
--inserindo 'data' como chave primária
alter table expedicao
	drop constraint expedicao_pkey,
	add constraint expedicao_pkey primary key(cods, codp, data),
	alter column data set not null;

--inserindo 'foto' na tabela 'peca'

alter table peca
	add column foto bytea;
	
select*from peca;
