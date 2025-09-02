create database teste;

create table teste(
	id serial primary key,
	data date,
	numero int,
	n2 numeric(5,2),
	dhora timestamp,
	letras char(10),
	letras2 varchar(100),
	texto text
);

alter table teste alter column numero set
data type float;

insert into teste (data, numero, n2, dhora, letras, letras2, texto)
values('2025-08-23', 1.300, 999.99, '2025-08-23 10:30:00', 'vascoooooo', 'vascodagama99', 'vascão gigante da colina');

alter table teste alter column numero set
not null;

alter table teste alter column letras set
not null;

create table pessoa(
	id serial primary key,
	nome varchar(20),
	idade int
);

do $$
begin
	for i in 1..100 loop
		insert into pessoa(nome, idade)
		values (
			'Pessoa_' || i,
			trunc(random() * 60 + 18)::int
		);
	end loop;
	
end$$















