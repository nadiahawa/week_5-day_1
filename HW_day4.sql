-- In-class exercise:
-- Are there any actors who appear in zero films? A join between the actor table and the film_actor table


select count(actor.)


select actor.actor_id, first_name, last_name, film_actor.film_id
from actor
left join film_actor
on actor.actor_id = film_actor.actor_id
where film_id is null;


select actor.actor_id, first_name, last_name, film_actor.film_id
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
where film_id is 1;
 join film_actor
on actor.actor_id = film_actor.actor_id
where film_id is 2;









--1. List all customers who live in Texas (use-JOINs)
select *
from customer c 
select *
from address


--ANSWER
select customer.address_id,customer.first_name , customer.last_name , address.district
from customer
join address
on customer.address_id  = address.city_id
where district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full-Name
select *
from payment p 
select *
from customer


select customer.customer_id, customer.first_name, customer.last_name
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99;




--3. Show all customers names who have made payments over $175(use-subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
)
order by customer.customer_id;






--4. List all customers that live in Nepal (use the city--table)
select *
from customer c 
select *
from address a 
select *
from city c2 
select *
from country 

select customer.first_name, customer.last_name, address.address, city.city, country.country
from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country = 'Nepal';





--5. Which staff member had the most-transactions?
select *
from staff
select *
from payment p 

select count(payment.staff_id), staff.staff_id 
from payment
join staff
on payment.staff_id = staff.staff_id 
group by staff.staff_id 
order by count(payment.staff_id) desc
limit 1;




--6. How many movies of each rating are-there?
select count(distinct rating)
from film;

select rating
from film
group by rating
order by count(rating) desc;




--7.Show all customers who have made a single payment--above $6.99 (Use Subqueries)

select customer.customer_id, customer.first_name, customer.last_name
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99;


select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having(amount) > 6.99
)

order by customer.customer_id;








select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by payment.amount
	where amount > 6.99
)
order by customer.customer_id;






select customer_id, first_name, last_name
from customer
where customer_id in (
	select payment.amount
	from payment
	where amount =6.99
);





--8.How many free rentals did our stoes give away?
select * 
from rental r 
select *
from dif_join_order djo 


select rental.customer_id
from rental
right join dif_join_order
on rental.customer_id  = dif_join_order.customer_id 
where dif_join_order.amount is null
limit 1;


