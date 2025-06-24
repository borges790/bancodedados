create table linguagem(
	linguagem_id serial,
	nome varchar(15),
	ultima_atualizacao timestamp
);

create table ator_filme(
	ator_id int,
	filme_id int,
	ultima_atualizacao timestamp
);

create table inventario(
	inventario_id serial,
	filme_id int,
	loja_id int,
	ultima_atualizacao timestamp
);

create table aluguel(
	aluguel_id serial,
	data_de_aluguel timestamp,
	inventario_id int,
	cliente_id int,
	data_de_retorno timestamp,
	funcionario_id int,
	ultima_atualizacao timestamp
);

create table pagamento(
	pagamento_id serial,
	cliente_id int,
	funcionario_id int,
	aluguel_id int,
	quantia numeric(4,2),
	data_de_pagamento timestamp
);

create table funcionario(
	funcionario_id serial,
	primeiro_nome varchar(20),
	ultimo_nome varchar(30),
	endereco_id int,
	email varchar(60),
	loja_id int,
	ativo bool,
	usuario varchar(30),
	senha char(4),
	ultima_atualizacao timestamp,
	foto bytea
);

create table ator(
	ator_id serial,
	primeiro_nome varchar(20),
	ultimo_nome varchar(30),
	ultima_atualizacao timestamp
);

create table cliente(
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar(20),
	ultimo_nome varchar(30),
	email varchar(60),
	endereco_id int,
	ativo bool,
	data_de_criacao timestamp,
	ultima_atualizacao timestamp
);

create table endereco(
	endereco_id serial,
	endereco varchar(40),
	endereco_2 varchar(40),
	distrito(20),
	cidade_id int,
	codigo_postal char(8),
	telefone char(11),
	ultima_atualizacao timestamp
);

create table cidade(
	cidade_id serial,
	cidade varchar(20),
	pais_id int,
	ultima_atualizacao timestamp
);

create table pais(
	pais_id serial,
	pais varchar(20),
	ultima_atualizacao timestamp
);

create table loja(
	loja_id serial,
	gerente_de_equipe_id int,
	endereco_id int,
	ultima_atualizacao timestamp
);


--remover coluna
alter table loja drop column ultima_atualizacao;

--adicionar coluna
alter table loja add column ultima_atualizacao timestamp;

--renomear coluna
alter table loja rename column ultima_atualizacao
	to ultima_atualizacao;

--alterar o tipo de dado da coluna
alter table loja alter column ultima_atualizacao
	set data type timestamp;

--criação de chaves primárias
alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table linguagem add primary key (linguagem_id);
alter table inventario add primary key (inventario_id);
alter table aluguel add primary key (aluguel_id);
alter table pagamento add primary key (pagamento_id);
alter table funcionario add primary key (funcionario_id);
alter table ator add primary key (ator_id);
alter table cliente add primary key (cliente_id);
alter table endereco add primary key (endereco_id);
alter table cidade add primary key (cidade_id);
alter table pais add primary key (pais_id);
alter table loja add primary key (loja_id);

--criação de chaves estrangeiras
alter table filme_categoria 
add constraint fk_categoria
foreign key (categoria_id)
references categoria (categoria_id);

alter table filme_categoria 
add constraint fk_filme
foreign key (filme_id)
references filme (filme_id);

alter table filme 
add constraint fk_linguagem
foreign key (linguagem_id)
references linguagem (linguagem_id);

alter table ator_filme
add constraint fk_ator
foreign key (ator_id)
references ator (ator_id);

alter table ator_filme
add constraint fk_filme
foreign key (filme_id)
references filme (filme_id);

alter table inventario --tabela que possui a chave estrangeira 
add constraint fk_filme --adiciona restrição na tabela a ser alterada
foreign key (filme_id) --define a chave estrangeira na tabela a ser alterada
references filme (filme_id); --referencia a tabela que possui a chave primária

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
references inventario (inventario_id);

alter table aluguel
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario (funcionario_id);

alter table pagamento
add constraint fk_aluguel
foreign key (aluguel_id)
references aluguel (aluguel_id);

alter table pagamento
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario (funcionario_id);






































