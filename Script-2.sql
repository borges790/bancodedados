--questão 1
select count(*) from film f inner join language l 
on f.language_id = l.language_id where l.name = 'português';

--questão 2
select count(*) from customer c inner join rental r
on c.customer_id = r.customer_id inner join inventory i 
on r.inventory_id = i.inventory_id inner join film f 
on i.film_id = f.film_id where f.film_id = 7;

--questão 3
select count(*) from rental r;

--questão 4
select f.replacement_cost as "Custo de Reposição" 
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


--questão 8
select count(*) 

--questão 9