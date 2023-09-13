
create database sistema_biblioteca;

use sistema_biblioteca;

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
	hora time)
	
);