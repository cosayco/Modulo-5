--1. Crear base de datos llamada: películas. 
CREATE DATABASE peliculas;
--2. Revisar  los  archivos  peliculas.csv  y  reparto.csv,  para  crear  las  tablas  correspondientes, determinando  la  relación  entre  ambas.  Los  nombres  de  los  atributos  en  la  tabla  películas serán: id, pelicula, estreno, director. Y los nombres de los atributos en la tabla reparto serán: id_pelicula, actor.
CREATE TABLE IF NOT EXISTS peliculas (
    id INT,
    pelicula VARCHAR(100),
    estreno INT,
    director VARCHAR(100)
    ); 

CREATE TABLE IF NOT EXISTS reparto (
    id_pelicula INT,
    actor VARCHAR(100)
    );

--3. Cargar ambos archivos a su tabla correspondiente. 
--Esto lo puedes realizar utilizando la sentencia: 
--\COPY “nombre_tabla” FROM ‘C:\...\nombre_archivo.csv’ WITH CSV; 

--\COPY "peliculas" FROM 'D:\xampp\htdocs\evaluacion\Modulo-5\sesion5\eva\ApoyoCSV\peliculas.csv' WITH CSV;
--\COPY "reparto" FROM 'D:\xampp\htdocs\evaluacion\Modulo-5\sesion5\eva\ApoyoCSV\reparto.csv' WITH CSV;
 
--7. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto. 
SELECT p.pelicula, p.estreno, p.director, r.actor
FROM peliculas p
JOIN reparto r ON p.id = r.id_pelicula
WHERE p.pelicula = 'Titanic';

--8. Listar los 10 directores más populares, indicando su nombre y cuántas películas aparecen en el top 100. 

--9. Indicar cuántos actores distintos hay. 
SELECT COUNT(DISTINCT actor) 
FROM reparto;

--10. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos), ordenadas por título de manera ascendente. 
SELECT pelicula
FROM peliculas
WHERE estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

--11. Listar los actores de la película más nueva.
SELECT r.actor 
FROM reparto r
JOIN peliculas p ON r.id_pelicula = p.id
WHERE p.estreno = (SELECT MAX(estreno) FROM peliculas);

--12. Inserte los datos de una nueva película solo en memoria, y otra película en el disco duro. 
--13. Actualice 5 directores utilizando ROLLBACK. 
--14. Inserte 3 actores a la película “Rambo” utilizando SAVEPOINT 
--15. Elimina las películas estrenadas el año 2008 solo en memoria. 
--16. Inserte 2 actores para cada película estrenada el 2001. 
--17. Actualice la película “King Kong” por el nombre de “Donkey Kong”, sin efectuar cambios en disco duro. 