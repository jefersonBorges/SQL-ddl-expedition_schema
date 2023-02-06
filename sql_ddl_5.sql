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

select * from peca;
select * from fornecedor;
select * from expedicao;

delete from peca where codp ='P1';
update peca set codp= 'P8' where codp ='P1';
/*
a. Ocorreu erro pois 'P1' é chave estrangeira no registro de 'expedicao', não pode ser excluída ou alterada.

https://www.postgresqltutorial.com/postgresql-foreign-key/
b. Especificar as ações para 'on delete' e 'on update'. Neste caso, a opção mais correta para on delete seria:
'on delete cascade'
para deletar todas as linhas de registro onde tenha a chave (primária ou estrangeira), a mais adequada para update seria:
'on update cascade'
para atualizar autoimaticamente todas as linhas com as alterações.
*/
--c.
drop table expedicao;
--Recriando a tabela expedição
CREATE TABLE expedicao (
  CODS varchar(5) NOT NULL,
  CODP varchar(5) NOT NULL,
  QTY int NOT NULL,
  PRIMARY KEY (CODS,CODP),
  CHECK (QTY > 0),
  FOREIGN KEY (CODS) REFERENCES fornecedor(CODS)
	on delete cascade
	on update cascade,
  FOREIGN KEY (CODP) REFERENCES peca(CODP)
	on delete cascade
	on update cascade
);
--Dumping tabela expecicao
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

--testando delete
delete from peca where codp ='P1';
select * from peca;

drop table expedicao;
drop table fornecedor;
drop table peca;

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

drop table expedicao;
--Recriando a tabela expedição
CREATE TABLE expedicao (
  CODS varchar(5) NOT NULL,
  CODP varchar(5) NOT NULL,
  QTY int NOT NULL,
  PRIMARY KEY (CODS,CODP),
  CHECK (QTY > 0),
  FOREIGN KEY (CODS) REFERENCES fornecedor(CODS)
	on delete cascade
	on update cascade,
  FOREIGN KEY (CODP) REFERENCES peca(CODP)
	on delete cascade
	on update cascade
);
--Dumping tabela expecicao
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

--testando update
update peca set codp ='P8' where codp = 'P1';

select * from expedicao;
select * from peca;
select * from fornecedor;