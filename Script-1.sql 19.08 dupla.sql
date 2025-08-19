create table usuario(
	id serial primary key,
	email varchar(50) not null unique,
	senha varchar(20) not null unique,
	cpf char(11) not null unique,
	telefone char(11) not null unique,
	criado_em timestamp not null
);

alter table usuario rename telefone to celular;

create table usuario_detalhe(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	nome varchar(30) not null,
	apelido varchar(20) not null,
	genero varchar(30) not null,
	descricao_foto text not null,
	raca varchar(20) not null,
	data_nascimento timestamp not null
);

alter table usuario_detalhe add column foto bytea;

create table usuario_endereco(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	cep char(8) not null,
	estado varchar(30) not null,
	cidade varchar(30) not null,
	bairro varchar(30) not null,
	rua varchar(30) not null,
	numero int not null,
	complemento text not null
);

create table usuario_endereco_entrega(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	destinatario varchar(100) not null,
	celular char(11) not null unique,
	cep char(8) not null,
	estado varchar(30) not null,
	cidade varchar(30) not null,
	bairro varchar(30) not null,
	rua varchar(30) not null,
	numero int not null,
	complemento text not null
);

create table usuario_login(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	data_hora timestamp not null,
	tipo varchar(100) not null
);

create table textos(
	id serial primary key,
	titulo varchar(30),
	imagem bytea,
	conteudo text,
	criado_em timestamp not null
);

create table textos_avaliacoes(
	id serial primary key,
	textos_id int not null,
	foreign key (textos_id) references textos(id),
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	nota int not null,
	comentario text,
	criado_em timestamp not null
);

create table textos_comentarios(
	id serial primary key,
	textos_id int not null,
	foreign key (textos_id) references textos(id),
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	comentario text not null,
	criado_em timestamp not null
);

create table produtos(
	id serial primary key,
	titulo varchar(30) not null,
	descricao text not null,
	preco numeric(5,2) not null,
	estoque int not null,
	imagem bytea
);

create table pedidos(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	usuario_endereco_entrega_id int not null,
	foreign key (usuario_endereco_entrega_id) references usuario_endereco_entrega(id),
	subtotal numeric(5,2) not null,
	frete numeric(5,2) not null,
	desconto numeric(5,2) not null,
	total numeric(5,2) not null,
	status varchar(30) not null,
	criado_em timestamp not null
);

create table pedidos_historico_status(
	id serial primary key,
	pedidos_id int not null,
	foreign key (pedidos_id) references pedidos(id),
	status varchar(30) not null,
	data date not null
);

create table pedidos_produtos(
	id serial primary key,
	pedidos_id int not null,
	foreign key (pedidos_id) references pedidos(id),
	produtos_id int not null,
	foreign key (produtos_id) references produtos(id),
	quantidade int not null,
	preco_unitario numeric(5,2) not null
);

create table pagamento(
	id serial primary key,
	pedidos_id int not null,
	foreign key (pedidos_id) references pedidos(id),
	metodo varchar(20) not null,
	status varchar(30) not null,
	codigo_transacao varchar(50) not null,
	criado_em timestamp not null
);

create table pagamento_cartao(
	id serial primary key,
	pagamento_id int not null,
	foreign key (pagamento_id) references pagamento(id),
	nome_cartao varchar(20) not null,
	numero_cartao char(16) not null unique,
	validade date not null,
	cvv char(3) not null
);

create table noticias(
	id serial primary key,
	titulo varchar(20) not null,
	imagem bytea,
	conteudo text not null,
	criado_em timestamp not null
);

create table cupons(
	id serial primary key,
	codigo varchar(20) not null,
	valor_desconto numeric(5,2) not null,
	percentual bool,
	valido_ate date not null
);

create table carrinho(
	id serial primary key,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id),
	criado_em timestamp not null,
	atualizado_em timestamp not null
);

create table carrinho_produtos(
	id serial primary key,
	carrinho_id int not null,
	foreign key (carrinho_id) references carrinho(id),
	produtos_id int not null,
	foreign key (produtos_id) references produtos(id),
	quantidade int not null,
	preco_unitario numeric(5,2) not null
);



















