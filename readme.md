![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Laboratorio | Subconsultas SQL

En este laboratorio, usarás la base de datos [Sakila](https://dev.mysql.com/doc/sakila/en/) de alquileres de películas. Crea las uniones apropiadas donde sea necesario.

### Entrega

Crea un archivo `.sql` donde recopilarás tus respuestas. Cópialas a medida que las pruebas en el workbench o códelas y ve a Archivo > Guardar script.

### Instrucciones

1. ¿Cuántas copias de la película _El Jorobado Imposible_ existen en el sistema de inventario?
2. Lista todas las películas cuya duración sea mayor que el promedio de todas las películas.
3. Usa subconsultas para mostrar todos los actores que aparecen en la película _Viaje Solo_.
4. Las ventas han estado disminuyendo entre las familias jóvenes, y deseas dirigir todas las películas familiares a una promoción. Identifica todas las películas categorizadas como películas familiares.
5. Obtén el nombre y correo electrónico de los clientes de Canadá usando subconsultas. Haz lo mismo con uniones. Ten en cuenta que para crear una unión, tendrás que identificar las tablas correctas con sus claves primarias y claves foráneas, que te ayudarán a obtener la información relevante.
6. ¿Cuáles son las películas protagonizadas por el actor más prolífico? El actor más prolífico se define como el actor que ha actuado en el mayor número de películas. Primero tendrás que encontrar al actor más prolífico y luego usar ese actor_id para encontrar las diferentes películas en las que ha protagonizado.
7. Películas alquiladas por el cliente más rentable. Puedes usar la tabla de clientes y la tabla de pagos para encontrar al cliente más rentable, es decir, el cliente que ha realizado la mayor suma de pagos.
8. Obtén el `client_id` y el `total_amount_spent` de esos clientes que gastaron más que el promedio del `total_amount` gastado por cada cliente.