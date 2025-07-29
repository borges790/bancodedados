create database hotel;

create table funcionario(
	funcionario_id serial,
	nome varchar(40),
	cpf char(11),
	cargo_id int
);

create table cargo(
	cargo_id serial,
	nome varchar(30)
);

create table hospede(
	hospede_id serial,
	nome varchar(40),
	cpf char(11),
	endereco_id int
);

create table endereco(
	endereco_id serial,
	logradouro varchar(50),
	localidade varchar(30),
	cep char(8),
	numero varchar(10),
	bairro varchar(40),
	uf varchar(30)
);

create table agenda(
	agenda_id serial,
	data_checkin timestamp,
	data_checkout timestamp,
	hospede_id int,
	funcionario_id int
);


alter table funcionario add primary key (funcionario_id);
alter table cargo add primary key (cargo_id);
alter table hospede add primary key (hospede_id);
alter table endereco add primary key (endereco_id);
alter table agenda add primary key (agenda_id);

alter table funcionario 
add constraint cargo_id
foreign key (cargo_id)
references cargo (cargo_id);
























