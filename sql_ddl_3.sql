set search_path = exercicio;

/*
Carregando(dumping) na tabela 'peca'
*/
INSERT INTO peca VALUES('P1','Nut','Red',12,'London');/*ok*/
INSERT INTO peca VALUES('P1','Bolt','Green',17,'Paris');/* a chave primária não pode ser duplicada ou receber valores diferentes */
INSERT INTO peca VALUES('P3','Screw','Blue',17,'Rome');/*ok*/
INSERT INTO peca VALUES('P4','Hammer','Red',14);/*ok*/
INSERT INTO peca VALUES('P5','Cam','Blue',-2,'Paris');/*weight não pode receber valores menores que zero */
INSERT INTO peca VALUES('P6','Cog','Black',19,'London');/*color só pode receber 3 valores :red, blue, green*/

select*from peca;
/*
Carregando(dumping) dados na tabela 'fornecedor'
*/
INSERT INTO fornecedor VALUES('S1','Smith',20,'London');/*ok*/
INSERT INTO fornecedor VALUES('S2','Smith',10,'Paris');/*sname não pode aparecer em outro registro, já que é uma chave única */
INSERT INTO fornecedor VALUES('S3','Blake',30,'Paris');/*ok*/
INSERT INTO fornecedor VALUES('S4','Clark',20,'London');/*ok*/
INSERT INTO fornecedor VALUES('S5','Adams',30,'Athens');/*ok*/

select*from fornecedor;

/*
Dumping data for table 'expedicao'
*/
INSERT INTO expedicao VALUES('S1','P1',-2);/*qty não pode receber valores negativos*/
INSERT INTO expedicao VALUES('S8','P2',200);/*não existe cods 'S8'*/
INSERT INTO expedicao VALUES('S1','P3',400);/*ok*/
INSERT INTO expedicao VALUES('S1','P4',200);/*ok*/
INSERT INTO expedicao VALUES('S1','P5',100);/*ok*/
INSERT INTO expedicao VALUES('S1','P6',100);/*ok*/
INSERT INTO expedicao VALUES('S2','P1',300);/*ok*/
INSERT INTO expedicao VALUES('S2','P2',400);/*ok*/
INSERT INTO expedicao VALUES('S3','P2',200);/*ok*/
INSERT INTO expedicao VALUES('S4','P2',200);/*ok*/
INSERT INTO expedicao VALUES('S4','P4',300);/*ok*/
INSERT INTO expedicao VALUES('S4','P5',400);/*ok*/

select*from expedicao;
