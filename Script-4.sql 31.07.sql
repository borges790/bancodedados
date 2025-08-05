update funcionario
set cargo_id = 4
where id = 2;


update agenda 
set data_checkout = '2025-11-01'
where hospede_id = 2;


delete from endereco 
where logradouro like 'A%';


drop table agenda;


alter table hospede alter column nome set not null
 alter column cpf set not null
 alter column endereco_id set not null;

alter table cargo alter column nome  set not null;


alter table funcionario alter column nome set not null
 alter column cpf set not null
 alter column cargo_id set not null;
 
 alter table endereco alter column logradouro set not null
 alter column localidade set not null
 alter column cep set not null
 alter column numero set not null
 alter column bairro set not null
 alter column uf set not null;
 
 alter table agenda alter column data_checkin set not null
 alter column data_checkout set not null
 alter column hospede_id set not null
 alter column funcionario_id set not null;
 
 
 delte from hospede 
 where cpf = '16889362789';



alter table hospede add unique (cpf)
alter table funcionario add unique (cpf);