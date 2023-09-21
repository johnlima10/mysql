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
select funcionario.nome, count(funcionario.nome) as quantidade_funcionarios --Agrupando numa coluna provisória para consulta quantidade_funcionarios
from funcionario
group by funcionario.nome

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
select cliente.nome, cliente.telefone, cliente.email  --O que deseja mostrar
from cliente
join rastreio on cliente.id_cliente = rastreio.id_cliente 
where rastreio.cod_de_rastreio ='0002';

create table area_do_cafe(
	id_area_cafe int primary key,
	id_cliente int,
	id_de_mesa int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_de_mesa) references reserva_de_mesa(id_de_mesa)
);

-- Inserindo dados na tabela

insert into padaria(id_da_padaria, nome, telefone)
values
(150, 'Padaria Bom Sabor', '98889-4433'),
(151, 'Padaria Bom Jesus', '97889-7833')

select * from padaria

insert into cliente(id_cliente, nome, email, telefone, id_da_padaria)
values
(1, 'Jonathan Lima', 'john@hotmail.com', '84988581245', 150),
(2, 'Maria José', 'mariaj@yahoo.com', '84987586874', 151)

select * from cliente

insert into produto(id_do_produto, nome, preco, descricao, ingrediente, id_da_padaria)
values
(25, 'Pão', 1.50, 'Pão Frances', 'farinha, fermento, sal', 150),
(26, 'Bolo', 50.99, 'Bolo de chocolate trufado', 'farinha, ovo, chocolate, leite', 151)

select * from produto

insert into funcionario(id_do_funcionario, nome, id_da_padaria)
values

(1000, 'José Maria Nascimento', 150),
(1001, 'Maria Eduarda Castro', 151),
(1002, 'João Maria Silva', 150),
(1003, 'Luana Silva Mendes', 151),
(1004, 'Jonas Castro Lima', 150),
(1005, 'Jefferson Luís Lima', 151),
(1006, 'Eva Lucia Silva', 150),
(1007, 'Cleonice Fereira Silva', 151)

select * from funcionario
--WHERE id_do_funcionario LIKE '%01';

insert into endereco(id_do_endereco, rua, numero, bairro, complemento, cep, cidade, uf, id_da_padaria)
values
(10, 'Rua São João', '22', 'Cidade Alta', '', 1256587, 'Natal', 'RN', 150),
(11, 'Av. Salgado Filho', '582', 'Lagoa Nova', '', 1256590, 'Natal', 'RN', 151)

select * from endereco

insert into pedido(id_do_pedido, data_de_pedido, hora_do_pedido, quantidade)
values
(150, '2023/09/13', '08:20', 10),
(151, '2023/09/13', '08:00', 1)

select * from pedido

insert into reserva_de_mesa(id_de_mesa, num_de_pessoa, preferencia, data_reserva, hora)
values
(23, '84988581245', 'Mesa interna', '2023/09/14', '15:00'),
(24, '84987586874', 'Mesa externa', '2023/09/14', '10:30')

select * from reserva_de_mesa

insert into area_do_cafe(id_area_cafe, id_cliente, id_de_mesa)
values
(001, 1, 23),
(002, 2, 24)

select * from area_do_cafe

insert into loja(id_do_pedido, id_do_produto, ped_presencial, ped_virtual)
values
(150, 25, '1500',''),
(151, 26, '1501','')

select * from loja

insert into rastreio(cod_de_rastreio, id_cliente, id_do_pedido)
values
(0001, 1, 150),
(0002, 2, 151)

select * from rastreio

insert into atendente(ver_validade_produto, atendimento, rep_de_produto, id_do_funcionario)
values
('Faz a verificação da validade dos produtos', 'Faz o atendimento dos clientes', 'Faz a reposição dos produtos', 1000),
('Faz a verificação da validade dos produtos', 'Faz o atendimento dos clientes', 'Faz a reposição dos produtos', 1001)

select * from atendente

insert into caixa(elab_relatorio, pagamento, recibo, id_do_funcionario)
values
('Faz a elaboração de relatórios', 'Recebe o pagamento dos clientes', 'Entrega o recibo aos clientes', 1002),
('Faz a elaboração de relatórios', 'Recebe o pagamento dos clientes', 'Entrega o recibo aos clientes', 1003)

select * from caixa

insert into gerente(ger_ativ_diaria, sac, financeiro_geral, id_do_funcionario)
values
('Faz o gerenciamentos das atividades diárias', 'É responsável pelo SAC', 'É responsável pelo financeiro geral', 1004),
('Faz o gerenciamentos das atividades diárias', 'É responsável pelo SAC', 'É responsável pelo financeiro geral', 1005)

select * from gerente

insert into padeiro(resp_pelo_processo, treinamento, supervisao, id_do_funcionario)
values
('É responsável pelo processo de produção', 'Faz o treinamento de funcionários', 'Supervisiona o processo de produção', 1006),
('É responsável pelo processo de produção', 'Faz o treinamento de funcionários', 'Supervisiona o processo de produção', 1007)

select * from padeiro
