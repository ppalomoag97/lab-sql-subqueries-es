use sakila;

-- ¿Cuántas copias de la película El Jorobado Imposible existen en el sistema de inventario?
SELECT f.title,
	sub1.Copias_películas
FROM film as f
	JOIN(SELECT i.film_id, COUNT( inventory_id) as Copias_películas
		FROM inventory as i
        GROUP BY i.film_id
        ) sub1
	ON f.film_id = sub1.film_id
where title='HUNCHBACK IMPOSSIBLE';

-- Lista todas las películas cuya duración sea mayor que el promedio de todas las películas.
SELECT f.title
FROM film as f
WHERE f.length > (SELECT AVG(length) FROM film);
 
-- Usa subconsultas para mostrar todos los actores que aparecen en la película Viaje Solo.
select a.first_name,
		a.last_name
from actor as a
WHERE a.actor_id IN (
	SELECT fa.actor_id
    FROM film_actor as fa
    WHERE fa.film_id = (
		SELECT f.film_id
        FROM film as f
        WHERE f.title = 'ALONE TRIP'
        )
	);

-- Las ventas han estado disminuyendo entre las familias jóvenes, y deseas dirigir todas las películas familiares a una promoción. Identifica todas las películas categorizadas como películas familiares.
select f.title
from film as f
WHERE f.film_id IN (
	SELECT fc.film_id
    FROM film_category as fc
    WHERE fc.category_id IN (
		SELECT c.category_id
        FROM category as c
        WHERE c.name = 'Family'
        )
	);


-- Obtén el nombre y correo electrónico de los clientes de Canadá usando subconsultas. Haz lo mismo con uniones. Ten en cuenta que para crear una unión, tendrás que identificar las tablas correctas con sus claves primarias y claves foráneas, que te ayudarán a obtener la información relevante.

SELECT c.first_name,
		c.last_name,
		c.email
FROM customer as c
WHERE c.address_id IN (
	SELECT a.address_id
    FROM address as a
    WHERE a.city_id IN (
		SELECT c.city_id
        FROM city as c
        WHERE c.country_id IN (
			SELECT co.country_id
			FROM country as co
			WHERE co.country = 'Canada'
			)
		)
	);
    
    -- SOLUCIÓN CON JOINS
    
SELECT c.first_name,
		c.last_name,
		c.email
FROM customer as c
	JOIN address as a
	ON c.address_id =  a.address_id
		JOIN city as ci
		ON  a.city_id =  ci.city_id
			JOIN country as co
			ON   ci.country_id = co.country_id
WHERE co.country = 'Canada'
;
-- ¿Cuáles son las películas protagonizadas por el actor más prolífico? El actor más prolífico se define como el actor que ha actuado en el mayor número de películas. Primero tendrás que encontrar al actor más prolífico y luego usar ese actor_id para encontrar las diferentes películas en las que ha protagonizado.
SELECT f.title
FROM film as f
JOIN film_actor as fa
ON f.film_id = fa.film_id
JOIN ( SELECT a.actor_id,
			COUNT(*) as Películas_protagonizadas
			FROM actor as a
            JOIN film_actor as fa
            ON fa.actor_id = a.actor_id
			GROUP BY a.actor_id
			ORDER BY Películas_protagonizadas DESC
			LIMIT 1
	) sub
ON fa.actor_id = sub.actor_id;

-- Películas alquiladas por el cliente más rentable. Puedes usar la tabla de clientes y la tabla de pagos para encontrar al cliente más rentable, es decir, el cliente que ha realizado la mayor suma de pagos.

SELECT c.first_name, c.last_name
from customer c
JOIN(
SELECT c.customer_id, sum(p.amount) AS Rentabilidad
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY Rentabilidad DESC
LIMIT 1) sub
ON c.customer_id = sub.customer_id;


-- Obtén el client_id y el total_amount_spent de esos clientes que gastaron más que el promedio del total_amount gastado por cada cliente

SELECT customer_id,
	sum(amount) as total_amount_spent
from payment
group by customer_id
having sum(amount) > (
	select  avg(total_amount)
    from (
		select customer_id, sum(amount) as total_amount
        from payment
        group by customer_id
        ) as avg_amount
);