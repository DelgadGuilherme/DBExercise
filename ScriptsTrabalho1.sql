/** Exercicio 1 **/

create database Carros;
Use Carros;

create table Automoveis(
	CODIGOAUTO int not null,
    Fabricante varchar(30),
    Modelo varchar(30),
    Ano varchar(10),
    Pais varchar(30),
	Preço_tabela float(4),
    constraint PK_CODIGOAUTO Primary key (CODIGOAUTO)
)

create table Revendedoras(
	CNPJ int not null,
    Nome varchar(30),
    Proprietario varchar(30),
    Cidade varchar(30),
    Estado varchar(30),
    constraint PK_CNPJ Primary key (CNPJ)
)

create table Consumidores(
	CPF int not null,
    Nome varchar(30),
    Sobrenome varchar(30),
    Telefone varchar(20),
    Cidade varchar(30),
    Estado varchar(30),
    constraint PK_CPF Primary key (CPF)
)

create table Negocios(
	CODIGOAUTO int not null,
    CPF int not null,
    CNPJ int not null,
    DataNegocio varchar(10),
    ValorNegocio float(20),
	constraint FK_CODIGOAUTO foreign key (CODIGOAUTO) references AUTOMOVEIS (CODIGOAUTO),
    constraint FK_CPF foreign key (CPF) references CONSUMIDORES (CPF),
    constraint FK_CNPJ foreign key (CNPJ) references REVENDEDORA (CNPJ)
)

create table Garagens(
	CODIGOAUTO int not null,
    CNPJ int not null,
    Quantidade int,
	constraint FK_CODIGOAUTO_GARAGEM foreign key (CODIGOAUTO) references AUTOMOVEIS (CODIGOAUTO),
    constraint FK_CNPJ_GARAGEM foreign key (CNPJ) references REVENDEDORA (CNPJ)
)

INSERT INTO `carros`.`automoveis` (`CODIGOAUTO`, `Fabricante`, `Modelo`, `Ano`, `Pais`, `Preço_tabela`) 
VALUES ('1', 'Fiat', 'Palio', '2019', 'Brasil', '2000');


INSERT INTO `carros`.`consumidores` (`CPF`, `Nome`, `Sobrenome`, `Telefone`, `Cidade`, `Estado`) 
VALUES ('111222', 'Antonio', 'Pereira', '24992424030', 'Vassouras', 'Rio de Janeiro');


INSERT INTO `carros`.`revendedora` (`CNPJ`, `Nome`, `Proprietario`, `Cidade`, `Estado`) 
VALUES ('111', 'CarrosK', 'Joao', 'Vassouras', 'Rio de Janeiro');


INSERT INTO `carros`.`negocios` (`CODIGOAUTO`, `CPF`, `CNPJ`, `DataNegocio`, `ValorNegocio`) 
VALUES ('7', '111222', '111', '08/09/2020', '2000');


INSERT INTO `carros`.`garagens` (`CODIGOAUTO`, `CNPJ`, `Quantidade`) 
VALUES ('7', '555', '5');

/** Exercicio 2 **/

/** a **/
SELECT fabricante, pais FROM carros.automoveis;

/** b **/
SELECT Estado FROM carros.garagens  AS a
INNER JOIN carros.automoveis AS b
ON a.CODIGOAUTO = b.CODIGOAUTO
INNER JOIN carros.revendedora AS C
ON a.CNPJ = c.CNPJ
WHERE (b.Modelo = 'Palio') AND (b.Fabricante = 'Fiat');

/** C **/
SELECT c.Nome FROM carros.garagens  AS a
INNER JOIN carros.automoveis AS b
ON a.CODIGOAUTO = b.CODIGOAUTO
INNER JOIN carros.revendedora AS C
ON a.CNPJ = c.CNPJ
WHERE b.Pais != 'Paris';


/** D **/
SELECT c.Nome, b.CODIGOAUTO, b.Modelo, b.Ano FROM carros.garagens  AS a
INNER JOIN carros.automoveis AS b
ON a.CODIGOAUTO = b.CODIGOAUTO
INNER JOIN carros.revendedora AS C
ON a.CNPJ = c.CNPJ

/** E **/
SELECT b.Nome, b.Sobrenome, b.Telefone FROM carros.negocios AS a
INNER JOIN carros.consumidores AS b
ON a.CPF = b.CPF

/** F **/
SELECT b.Nome FROM carros.negocios AS a
INNER JOIN carros.revendedora AS b
ON a.CNPJ = b.CNPJ
where a.DataNegocio LIKE '%2019' LIMIT 3

/** G **/ 
SELECT MIN(a.ValorNegocio), b.Fabricante, b.Modelo, b.Ano, c.Nome FROM carros.negocios AS a
INNER JOIN carros.automoveis AS b
ON a.CODIGOAUTO = b.CODIGOAUTO
INNER JOIN carros.revendedora AS c
ON a.CNPJ = c.CNPJ

/** H **/
SELECT * FROM carros.garagens
order by quantidade DESC LIMIT 10