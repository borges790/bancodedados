create database estacionamento;

create table vaga (  
	id serial primary key,
	número varchar(4) not null unique
);


create table carro (  --criação de tabela completa 
	id serial primary key,
	marca varchar(25) not null,
	modelo char (8) not null,
	chassi char(1) not null unique,
	vaga_id int not null,
	foreign key (vaga_id) references vaga(id)
);

create table tempo (  
	id serial primary key,
	data_hora_chegada timestamp not null,
	data_hora_saida timestamp not null,
	carro_id int not null,
	vaga_id int not null,
	foreign key (carro_id) references carro(id),
	foreign key (vaga_id) references vaga(id)
);