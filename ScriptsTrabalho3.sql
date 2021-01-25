/** Exercicio 3 **/

create database Empresa;
Use Empresa;

create table Departamento(
	IdDepartamento int not null,
    NomeDepartamento varchar(40),
    constraint PK_IdDepartamento primary key (IdDepartament)
)

create table Cargo(
	IdCargo int not null,
    NomeCargo varchar(50),
    SalarioBase float,
    constraint PK_IdCargo primary key (IdCargo)
)

create table Funcionario(
	IdFunc int not null,
    NomeFunc varchar(50),
    CPF int,
    IdCargo int,
    IdDepartamento int,
	constraint PK_IdFuncionario primary key (IdFunc),
    constraint FK_IdCargo foreign key (IdCargo) references Cargo (IdCargo),
    constraint FK_IdDepartamento foreign key (IdDepartamento) references Departamento (IdDepartamento)
)

create table Projeto(
	IdProjeto int not null,
    NomeProjeto varchar(50),
    DataInicio date,
    IdDepartamento int,
	constraint PK_IdProjeto primary key (IdProjeto),
    constraint FK_IdDepartamentoProj foreign key (IdDepartamento) references Departamento (IdDepartamento)
)

create table ProjetoFuncionario(
	IdFuncionario int,
    IdProjeto int,
    constraint FK_IdFuncionarioProjFunc foreign key (IdFuncionario) references Funcionario (IdFunc),
	constraint FK_IdProjetoProjFunc foreign key (IdProjeto) references Projeto (IdProjeto)
)


/** Tabela Cargo **/
INSERT INTO `empresa`.`cargo` (`IdCargo`, `NomeCargo`, `SalarioBase`)
VALUES ('1', 'Administrador', '3000');

INSERT INTO `empresa`.`cargo` (`IdCargo`, `NomeCargo`, `SalarioBase`) 
VALUES ('2', 'Desenvolvedor', '5000');

INSERT INTO `empresa`.`cargo` (`IdCargo`, `NomeCargo`, `SalarioBase`) 
VALUES ('3', 'Desenvolvedor', '5000');

INSERT INTO `empresa`.`cargo` (`IdCargo`, `NomeCargo`, `SalarioBase`) 
VALUES ('4', 'CEO', '7000');

INSERT INTO `empresa`.`cargo` (`IdCargo`, `NomeCargo`, `SalarioBase`) 
VALUES ('5', 'Investidor', '2500');


/** Tabela Departamento **/
INSERT INTO `empresa`.`departamento` (`IdDepartamento`, `NomeDepartamento`) 
VALUES ('100', 'Administração');

INSERT INTO `empresa`.`departamento` (`IdDepartamento`, `NomeDepartamento`) 
VALUES ('101', 'Desenvolvimento');

INSERT INTO `empresa`.`departamento` (`IdDepartamento`, `NomeDepartamento`) 
VALUES ('102', 'Presidencia');

INSERT INTO `empresa`.`departamento` (`IdDepartamento`, `NomeDepartamento`) 
VALUES ('103', 'Investimento');

INSERT INTO `empresa`.`departamento` (`IdDepartamento`, `NomeDepartamento`) 
VALUES ('104', 'Vendas');


/** Tabela Funcionario **/
INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('345', 'Clark Kent', '1234', '3', '101');

INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('346', 'Darth Vader', '12345', '4', '102');

INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('347', 'Luke skywalker', '123456', '1', '100');

INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('348', 'Bruce Wayne', '123467', '4', '102');

INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('349', 'Lois Lane', '123456778', '4', '102');

INSERT INTO `empresa`.`funcionario` (`IdFunc`, `NomeFunc`, `CPF`, `IdCargo`, `IdDepartamento`) 
VALUES ('350', 'Dick Grayson', '123444982', '1', '100');


/** Tabela Projeto **/
INSERT INTO `empresa`.`projeto` (`IdProjeto`, `NomeProjeto`, `DataInicio`, `IdDepartamento`) 
VALUES ('500', 'Voce sangra?', '2020-06-01', '102');

INSERT INTO `empresa`.`projeto` (`IdProjeto`, `NomeProjeto`, `DataInicio`, `IdDepartamento`) 
VALUES ('501', 'Investimento em "Rastreio seu pai"?', '2020-05-03', '103');

INSERT INTO `empresa`.`projeto` (`IdProjeto`, `NomeProjeto`, `DataInicio`, `IdDepartamento`) 
VALUES ('502', 'Jovens titans', '2020-05-07', '100');

INSERT INTO `empresa`.`projeto` (`IdProjeto`, `NomeProjeto`, `DataInicio`, `IdDepartamento`) 
VALUES ('503', 'Jornal online', '2020-12-06', '101');

INSERT INTO `empresa`.`projeto` (`IdProjeto`, `NomeProjeto`, `DataInicio`, `IdDepartamento`) 
VALUES ('504', 'Venada do Jornal online', '2020-11-10', '104');

/** Tabela ProjetoFuncionario **/
INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('348','500');

INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('345','500');

INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('347','501');

INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('346','501');

INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('350','502');

INSERT INTO `empresa`.`projetofuncionario` (`IdFuncionario`,`IdProjeto`) 
VALUES ('345','504');

/** a **/
SELECT b.NomeFunc FROM projetofuncionario a
INNER JOIN funcionario b
ON a.IdFuncionario = b.IdFunc
INNER JOIN projeto c
ON a.IdProjeto = c.IdProjeto
INNER JOIN departamento d
ON d.IdDepartamento = c.IdDepartamento
WHERE d.NomeDepartamento = 'Vendas'


/** b **/
SELECT COUNT(*) FROM projetofuncionario a
INNER JOIN funcionario b
ON a.IdFuncionario = b.IdFunc
WHERE b.NomeFunc = 'Clark Kent';

/** c **/
SELECT c.NomeProjeto, d.NomeDepartamento FROM projetofuncionario a
INNER JOIN funcionario b
ON a.IdFuncionario = b.IdFunc
INNER JOIN projeto c
ON a.IdProjeto = c.IdProjeto
INNER JOIN departamento d
ON c.IdDepartamento = d.IdDepartamento
WHERE b.IdFunc = '345'

/** d **/
SELECT * FROM cargo
order by SalarioBase DESC LIMIT 3

/** e **/
SELECT b.NomeFunc FROM cargo a
INNER JOIN funcionario b
ON a.IdCargo = b.IdCargo
order by SalarioBase DESC LIMIT 10

/** f **/
SELECT e.NomeCargo, b.NomeFunc, d.IdDepartamento, d.NomeDepartamento, c.NomeProjeto  FROM projetofuncionario a
INNER JOIN funcionario b
ON a.IdFuncionario = b.IdFunc
INNER JOIN projeto c
ON c.IdProjeto = a.IdProjeto
INNER JOIN departamento d
ON c.IdDepartamento =  d.IdDepartamento
INNER JOIN cargo e
ON b.IdCargo = e.IdCargo
WHERE c.DataInicio  between '2020-01-01' and '2020-10-01'
ORDER BY NomeProjeto