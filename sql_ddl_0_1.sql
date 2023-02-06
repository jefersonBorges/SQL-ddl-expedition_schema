create schema exercicio;

set search_path = exercicio;

create table PECA(
	codp char(5) not null,
	pname varchar(30) unique not null,
	color varchar(20) check (color in ('Red', 'Blue', 'Green')),
	weight decimal(10,2) check(weight>0),
	city varchar(30) default 'london',
	primary key(codp)
);

select * from PECA

create table FORNECEDOR(
	cods char(5) not null,
	sname varchar(30) unique not null,
	status char(1),
	city varchar(30),
	primary key(cods)
);

select * from FORNECEDOR;

create table EXPEDICAO(
	codp char(5),
	cods char(5),
	qty int check( qty>=0),
	primary key(codp, cods),
	foreign key (codp) references peca(codp),
	foreign key (cods) references fornecedor(cods)
);

select * from EXPEDICAO;
