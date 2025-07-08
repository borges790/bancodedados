create database google_classroom;

create table aluno(
	aluno_id serial,
	nome varchar(40),
	idade varchar(3),
	cpf char(11)
);

create table professor(
	professor_id serial,
	materia_id int,
	nome_completo varchar(40),
	cpf char(11),
	email varchar(60)
);

create table usuario(
	usuario_id serial,
	nome_completo varchar(40),
	senha char(8),
	email varchar(60)
);

create table sala_de_aula(
	sala_de_aula_id serial,
	descricao text,
	quantidade_alunos varchar(40),
	codigo_convite char(9),
	professor_id int
);

create table atividade(
	atividade_id serial,
	sala_de_aula_id int,
	titulo varchar(30),
	descricao text,
	data_criacao timestamp,
	data_entrega timestamp
);

create table materia(
	materia_id serial,
	nome_materia varchar(15),
	professor_id int,
	atividade_id int
);


alter table aluno add primary key (aluno_id);
alter table professor add primary key (professor_id);
alter table usuario add primary key (usuario_id);
alter table sala_de_aula add primary key (sala_de_aula_id);
alter table atividade add primary key (atividade_id);
alter table materia add primary key (materia_id);

alter table materia 
add constraint professor_id
foreign key (professor_id)
references professor (professor_id);

alter table sala_de_aula 
add constraint professor_id
foreign key (professor_id)
references professor (professor_id);

alter table atividade 
add constraint sala_de_aula_id
foreign key (sala_de_aula_id)
references sala_de_aula  (sala_de_aula_id);

alter table materia 
add constraint atividade_id
foreign key (atividade_id)
references atividade (atividade_id);

alter table aluno
add constraint materia_id
foreign key (materia_id)
references materia (materia_id);

alter table aluno 
add constraint usuario_id
foreign key (usuario_id)
references usuario (usuario_id);

alter table professor
add constraint usuario_id
foreign key (usuario_id)
references usuario (usuario_id);

alter table aluno add column usuario_id int;
alter table professor add column usuario_id int;
alter table aluno add column materia_id int;
alter table aluno add column atividade_pendente ;
alter table atividade add column concluido bool;
alter table aluno add column notas numeric (3,1);
alter table sala_de_aula alter column codigo_convite
	set data type varchar(8);

select * from atividade;

select * from sala_de_aula;

select count(*) as "Quantidade de alunos" from sala_de_aula sda 
group by quantidade_alunos;

select * from materia m 
where atividade_id is null;

select sda.codigo_convite from sala_de_aula sda;

select a.notas from aluno a 
inner join materia m on m.materia_id = a.materia_id 
where m.nome_materia = :nome_materia and a.nome = :nome_aluno;

select p.nome_completo as "Nome" from professor p;

select * from usuario u;

select ati.data_entrega from atividade ati
inner join materia m on ati.atividade_id = m.atividade_id
where m.nome_materia = :nome_materia and ati.atividade_id = :id_atividade;

select count(*) from sala_de_aula sda 
inner join professor p on sda.professor_id = p.professor_id 
group by p.nome_completo;

select count(*) from sala_de_aula sda
inner join atividade a on sda.sala_de_aula_id = a.sala_de_aula_id 
group by a.concluido;

select ati.data_criacao from atividade ati
inner join materia m on ati.atividade_id = m.atividade_id
where m.nome_materia = :nome_materia and ati.atividade_id = :id_atividade;
























