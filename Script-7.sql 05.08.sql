select * from vaga;

select *from carro;

select *from tempo;

update vaga v set numero = '22'
where numero = '5';

update vaga v set numero = '51'
where numero = '4';

update vaga v set numero = '79'
where numero = '3';

update vaga v set numero = '17'
where numero = '2';

update vaga v set numero = '48'
where numero = '1';

delete from vaga v where numero = '1';

delete from vaga v where numero = '2';

delete from vaga v where numero = '3';

delete from vaga v where numero = '4';

delete from vaga v where numero = '5';

insert into vaga (numero)
values ('6'),
 ('7'),
 ('8'),
 ('9'),
 ('10'),
 ('11'),
 ('12'),
 ('13'),
 ('14'),
 ('15');
 
insert into carro (marca, modelo, chassi, vaga_id)
values ('Volkswagen', 'Golf', 'a', 6),
('Mercedes-Benz', 'Classe C', 'b', 7),
('Audi', 'A4', 'c', 8),
('Hyundai', 'HB20', 'd', 9),
('Nissan', 'Versa', 'e', 10),
('Jeep', 'Renegade', 'f', 11),
('Peugeot', '208', 'g', 12),
('Fiat', 'Pulse', 'h', 13),
('Renault', 'Duster', 'i', 14),
('Kia', 'Sportage', 'j', 15);

insert into tempo (data_hora_chegada, data_hora_saida, carro_id, vaga_id)
values ('2025-06-05 07:51:30.025', '2025-06-05 08:40:21.031', 6, 6),
  ('2025-07-21 16:24:40.023', '2025-07-22 20:49:59.059', 7, 7),
  ('2025-08-14 07:45:33.033', '2025-08-14 17:40:42.043', 8, 8),
  ('2025-06-25 08:51:23.028', '2025-06-25 18:40:01.020', 9, 9),
  ('2025-06-22 06:33:13.011', '2025-06-23 6:30:36.024', 10, 10),
  ('2024-08-05 07:51:30.025', '2024-08-05 08:40:21.031', 11, 11),
  ('2024-07-23 16:24:40.023', '2024-07-23 20:49:59.059', 12, 12),
  ('2024-08-04 07:45:33.033', '2024-08-04 17:40:42.043', 13, 13),
  ('2025-06-05 07:51:23.028', '2025-06-05 19:40:01.020', 14, 14),
  ('2025-05-22 05:33:13.011', '2025-05-23 06:30:36.024', 15, 15);

SELECT modelo FROM carro c
 INNER JOIN vaga v ON v.id = c.vaga_id
 WHERE v.numero = 44;

SELECT marca FROM carro c
 INNER JOIN vaga v ON v.id = c.vaga_id
 WHERE v.numero = 1023;
 
 SELECT data_hora_chegada FROM tempo t 
 INNER JOIN carro c ON c.id = t.carro_id
 WHERE t.carro_id = 14;
























