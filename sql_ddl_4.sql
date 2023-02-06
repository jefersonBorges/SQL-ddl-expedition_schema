/*
Carregando(dumping) na tabela 'peca'
*/
INSERT INTO peca VALUES('P1','Nut','Red',12,'London');
INSERT INTO peca VALUES('P2','Bolt','Green',17,'Paris');/*alteração em codp 'p1' para 'p2'*/
INSERT INTO peca VALUES('P3','Screw','Blue',17,'Rome');
INSERT INTO peca VALUES('P4','Hammer','Red',14);
INSERT INTO peca VALUES('P5','Cam','Blue',12,'Paris');/*alteração em weight '-2' para '12'*/
INSERT INTO peca VALUES('P6','Cog','Red',19,'London');/*alteração em color 'Black' para 'Red'*/

/*
Carregando(dumping) dados na tabela 'fornecedor'
*/
INSERT INTO fornecedor VALUES('S1','Smith',20,'London');
INSERT INTO fornecedor VALUES('S2','Jones',10,'Paris');/*alteração em sname 'Smith' para 'Jones'*/
INSERT INTO fornecedor VALUES('S3','Blake',30,'Paris');
INSERT INTO fornecedor VALUES('S4','Clark',20,'London');
INSERT INTO fornecedor VALUES('S5','Adams',30,'Athens');

/*
Dumping data for table 'expedicao'
*/
INSERT INTO expedicao VALUES('S1','P1',300);/*alteração em qty '-2' para '300'*/
INSERT INTO expedicao VALUES('S1','P2',200);/*alteração de cods 'S8' para 'S1'*/
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