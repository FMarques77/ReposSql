create table Cliente (
idCliente int identity,
nomeCliente varchar (255) not null,
CPF char (11) not null, 
telefoneCliente varchar(14),
cepCliente char (8) not null,
logradouroCliente varchar (255) not null,
numerologradouroCliente varchar (5) not null,
cidadeCliente varchar (255) not null, 
estadoCliente varchar (2) not null,
datanascCliente datetime not null,
senhaCliente varchar (6) not null,
emailCliente varchar (50) not null,
constraint pk_Cliente primary key (idCliente),
);

create table Conta (
idContaCliente int identity, /* status no git*/
idCliente int identity not null,
saldoCliente decimal (10,2),       
tipocontaCliente varchar (30),
constraint pk_ContaCliente primary key (idContaCliente),
constraint fk_Cliente foreign key (idCliente) references Cliente (idCliente),
);

create table Operacao (
idOperacao int identity,
idContaCliente int identity not null,
dataTransacao datetime not null, 
valorTransacao decimal (10,2),     
tipoTransacao varchar (30),
dataHora datetime not null,
constraint pk_Operacao primary key (idOperacao),
constraint fk_ContaCliente foreign key (idContaCliente) references Conta (idContaCliente),
);

create table NomeTransacoes 
idTransacoes int identity,
idContaCliente int identity not null,
deposito varchar (255) not null,
transferencia varchar (255) not null,
saque varchar (255) not null,
constraint pk_Transacoes primary key (idTransacoes),
constraint fk_ContaCliente foreign key (idContaCliente) references Conta (idContaCliente),
);

create table Agendamento (
idAgendamento int identity,
idContaCliente int identity not null,
idTransacoes int identity not null,
dataAgendamento datetime not null, 
valorAgendado decimal (10,2),     
statusAgendamento varchar (10),
constraint pk_Agendamento primary key (idAgendamento),
constraint fk_ContaCliente foreign key (idContaCliente) references Conta (idContaCliente),
constraint fk_Transacoes foreign key (idTransacoes) references Operacao (idTransacoes),
);

create table StatusConta (
idStatus int identity, 
idContaCliente int identity not null,
nomeStatus varchar (10),
dataHora datetime not null,
constraint pk_Status primary key (idStatus),
constraint fk_ContaCliente foreign key (idContaCliente) references Conta (idContaCliente),
);