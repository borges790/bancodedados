--questão 1
select count(*) from film f inner join language l 
on f.language_id = l.language_id where l.name = 'português';

--questão 2
select count(*) from customer c inner join rental r
on c.customer_id = r.customer_id inner join inventory i 
on r.inventory_id = i.inventory_id inner join film f 
on i.film_id = f.film_id where f.film_id = 7;

--questão 3
select count(*) as "Quantidade de alugueis" from rental r;

--questão 4
select f.title as "Título do filme",
f.replacement_cost as "Custo de Reposição" 
from film f where f.film_id = 600;

--questão 5
select s.first_name, s.last_name, count(r.rental_id) from staff s 
inner join rental r on s.staff_id = r.staff_id 
group by s.first_name, s.last_name order by count(r.rental_id) desc limit 1;

--questão 6
select a.address_id, count(*) from staff sta inner join store sto 
on sta.store_id = sto.store_id inner join address a 
on a.address_id = sto.address_id group by a.address_id;

--questão 7
select f.title as "Título do filme", l.name as "Idioma",
f.replacement_cost as "Custo de reposição", 
r.rental_date as "Data do aluguel", c.first_name as "Nome do cliente",
s.first_name as "Nome do fucionário", s2.store_id as "Id da loja",
f.rental_rate as "Valor do aluguel" from film f 
inner join language l on l.language_id = f.language_id
inner join inventory i on i.film_id = f.film_id
inner join rental r on r.inventory_id = i.inventory_id
inner join customer c on c.customer_id = r.customer_id
inner join staff s on s.staff_id = r.staff_id
inner join store s2 on s2.store_id = s.store_id
order by r.rental_date desc limit 1;

--questão 8
select count(*) as "Quantidade de atores" from film_actor fa 
where fa.film_id = 1;

--questão 9
select s.store_id as "Id da loja", count(i.inventory_id) from store s 
inner join staff s2 on s2.store_id = s.store_id 
inner join rental r on r.staff_id = s2.staff_id 
inner join inventory i on i.inventory_id = r.inventory_id
group by s.store_id order by count(i.inventory_id) desc limit 1;







