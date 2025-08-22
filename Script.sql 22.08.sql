create database mariabolsas;

create table login(
	id serial primary key,
	email varchar(60) not null,
	senha varchar(20) not null unique
);

create table cadastro(
	id serial primary key,
	nome varchar(30) not null,
	sobrenome varchar(50) not null,
	cpf char(11) not null unique,
	celular char(11) not null unique,
	email varchar(60) not null,
	cep char(8) not null,
	rua varchar(50) not null,
	numero int not null,
	ponto_referencia varchar(200) not null,
	bairro varchar(50) not null,
	cidade varchar(40) not null,
	estado varchar(40) not null
);

create table dados_pessoais(
	id serial primary key,
	imagem bytea,
	nome varchar(30) not null,
	sobrenome varchar(50) not null,
	cpf char(11) not null unique,
	telefone char(11) not null unique,
	genero varchar(30) not null,
	data_nascimento date not null,
	cadastro_id int not null,
	foreign key (cadastro_id) references cadastro(id)
);

create table minha_conta(
	id serial primary key,
	dados_pessoais_id int not null,
	foreign key (dados_pessoais_id) references dados_pessoais(id),
	enderecos_id int not null,
	foreign key (enderecos_id) references enderecos(id),
	meus_pedidos_id int not null,
	foreign key (meus_pedidos_id) references meus_pedidos(id)
);

create table produto(
	id serial primary key,
	titulo varchar(50) not null,
	descricao text not null,
	estoque int not null,
	preco numeric(5,2) not null,
	cor varchar(30) not null,
	peso float,
	medidas varchar(20) not null
);

create table carrinho(
	id serial primary key,
	produto_id int not null,
	foreign key (produto_id) references produto(id),
	valor_total numeric(5,2) not null
);

create table enderecos(
	id serial primary key,
	pais varchar(30) not null,
	cep char(8) not null,
	numero int not null,
	complemento_referencia varchar(200) not null,
	destinatario varchar(50) not null
);

create table meus_pedidos(
	id serial primary key,
	produto_id int not null,
	foreign key (produto_id) references produto(id)
);

create table pagamento(
	id serial primary key,
	carrinho_id int not null,
	foreign key (carrinho_id) references carrinho(id),
	formas_pagamento varchar(25) not null,
	cupom varchar(40),
	subtotal numeric(5,2) not null,
	total numeric(5,2) not null
);

create table cartao_credito(
	id serial primary key,
	numero_cartao char(16) not null unique,
	validade date not null,
	cvc char(3) not null unique,
	nome_cartao varchar(30) not null
);








