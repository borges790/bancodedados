create database escritorio;

create table funcionario(
	funcionario_id serial,
	nome varchar(30),
	data_nascimento timestamp,
	cpf char(11),
	endereco_id int,
	cargo_id int
);

create table endereco(
	endereco_id serial,
	logradouro varchar(50),
	localidade varchar(30),
	uf varchar(30),
	cep char(8),
	bairro varchar(40)
);

create table cargo(
	cargo_id serial,
	nome varchar(35),
	descricao text
);

alter table funcionario add primary key (funcionario_id);
alter table endereco add primary key (endereco_id);
alter table cargo add primary key (cargo_id);

alter table funcionario 
add constraint endereco_id
foreign key (endereco_id)
references endereco (endereco_id);

alter table funcionario 
add constraint cargo_id
foreign key (cargo_id)
references cargo (cargo_id);

INSERT INTO endereco (endereco_id, logradouro, localidade, uf, cep, bairro)
VALUES (1, 'Rua Lopes Trovão', 'Petrópolis', 'RJ', 25635111, 'Alto da Serra'),
(2, 'Rua Dr.Thouzet', 'Petrópolis', 'RJ', 25437869, 'Thouzet'),
(3, 'Rua Tereza', 'Petrópolis', 'RJ', 56087321, 'Marechal Deodoro'),
(4, 'Rua Gregório Cruzick', 'Petrópolis', 'RJ', 67983219, 'Bela Vista'),
(5, 'Rua João de Farias', 'Petrópolis', 'RJ', 25763890, 'Alcobacinha');

INSERT INTO cargo (cargo_id, nome, descricao)
VALUES (1, 'Vendedor', 'Reponsável pelo atendimento ao cliente'),
(2, 'Faxineiro', 'Responsável por limpar e organizar o ambiente'),
(3, 'Caixa', 'Responsável por processar as vendas, receber pagamentos e emitir notas fiscais'),
(4, 'Gerente de Loja', 'Gerencia e fiscaliza as operações e vendas'),
(5, 'Profissional de Marketing', 'Responsável por ações de marketing digital');

INSERT INTO funcionario (funcionario_id, nome, data_nascimento, cpf, endereco_id, cargo_id)
VALUES (1, 'Maria', '23-04-1987', 12345678907, 2, 5),
(2, 'João', '02-10-2000', 98765432120, 1, 4),
(3, 'Julia', '20-07-1999', 87694523109, 3, 3),
(4, 'Vitor', '09-06-1990', 78569234109, 5, 1),
(5, 'Carol', '15-11-2003', 45629817345, 4, 2);














