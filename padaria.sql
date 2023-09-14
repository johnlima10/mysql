-- Criando o banco de dados 

create database sistema_padaria;

-- Usando o banco que criei

use sistema_padaria;

-- Criando a tabela padaria

create table padaria(
	id_da_padaria int primary key,
	nome varchar(50),
	telefone char(13)
);

create table cliente(
	id_cliente int primary key,
	nome varchar(50),
	email varchar(60),
	telefone char(13),
	id_da_padaria int,
	foreign key (id_da_padaria) references padaria(id_da_padaria)
);

create table produto(
	id_do_produto int primary key,
	nome varchar(50),
	preco float(10),
	descricao varchar(60),
	ingrediente varchar(60),
	id_da_padaria int,
	foreign key (id_da_padaria) references padaria(id_da_padaria)
);

create table funcionario(
	id_do_funcionario int primary key,
	nome varchar(50),
	id_da_padaria int,
	foreign key (id_da_padaria) references padaria(id_da_padaria)
);

create table endereco(
	id_do_endereco int primary key,
	rua varchar(50),
	numero varchar(10),
	bairro varchar(15),
	complemento varchar(10),
	cep int,
	cidade varchar(40),
	uf char(2),
	id_da_padaria int,
	foreign key (id_da_padaria) references padaria(id_da_padaria)
);

create table pedido(
	id_do_pedido int primary key,
	data_de_pedido date,
	hora_do_pedido time,
	quantidade int,		
);

create table reserva_de_mesa(
	id_de_mesa int primary key,
	num_de_pessoa char(13),
	preferencia varchar(50),
	data_reserva date,
	hora time
);

create table padeiro(
	resp_pelo_processo varchar(50),
	treinamento varchar(50),
	supervisao varchar(50),
	id_do_funcionario int,
	foreign key (id_do_funcionario) references funcionario(id_do_funcionario)
);

create table atendente(
	ver_validade_produto varchar(50),
	atendimento varchar(50),
	rep_de_produto varchar(50),
	id_do_funcionario int,
	foreign key (id_do_funcionario) references funcionario(id_do_funcionario)
);

create table caixa(
	elab_relatorio varchar(50),
	pagamento varchar(50),
	recibo varchar(50),
	id_do_funcionario int,
	foreign key (id_do_funcionario) references funcionario(id_do_funcionario)
);

create table gerente(
	ger_ativ_diaria varchar(50),
	sac varchar(50),
	financeiro_geral varchar(50),
	id_do_funcionario int,
	foreign key (id_do_funcionario) references funcionario(id_do_funcionario)
);

create table loja(
	id_do_pedido int,
	id_do_produto int,
	ped_presencial varchar(50),
	ped_virtual varchar(50),	
	foreign key (id_do_pedido) references pedido(id_do_pedido),
	foreign key (id_do_produto) references produto(id_do_produto)
);

create table rastreio(
	cod_de_rastreio int primary key,
	id_cliente int,
	id_do_pedido int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_do_pedido) references pedido(id_do_pedido)
);

create table area_do_cafe(
	id_area_cafe int primary key,
	id_cliente int,
	id_de_mesa int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_de_mesa) references reserva_de_mesa(id_de_mesa)
);