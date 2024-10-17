--Listar todas las “rental” con los datos del “customer” dado un año y mes
SELECT r.rental_id AS Numero
 , r.rental_date AS Fecha_Arriendo
 , c.first_name AS Nombre
 , c.last_name AS Apellido
 , c.email AS Correo
 , a.address AS Direccion
 , a.phone AS Telefono
FROM rental r 
   INNER JOIN customer c ON c.customer_id = r.customer_id
   LEFT JOIN address a ON a.address_id = c.address_id
WHERE DATE_PART('year', r.rental_date) = 2005
AND DATE_PART('month', r.rental_date) = 5
ORDER BY r.rental_date desc;

--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
SELECT payment_id AS Numero
 , payment_date AS Fecha
 , SUM(amount) AS Total
FROM payment
GROUP BY payment_id, payment_date;

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0
SELECT f.title AS Titulo
 , f.description AS Descripcion
 , l.name AS Idioma
FROM film f
    LEFT JOIN language l ON f.language_id = l.language_id
WHERE f.release_year = 2006
AND f.rental_rate > 4;

--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente
SELECT table_name AS Tabla
 , column_name AS Columna
 , CASE WHEN is_nullable = 'YES' THEN 'SI' ELSE 'NO' END AS EsNula
 , CONCAT(udt_name,' - (',data_type,')') AS TipoDato
 , COALESCE(character_maximum_length, 0) AS Largo_Varchar
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;