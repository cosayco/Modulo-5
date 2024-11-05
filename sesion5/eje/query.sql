--Crear tabla “editoriales”, con los atributos código y nombre. Definir el código como llave primaria.
CREATE TABLE IF NOT EXISTS editoriales (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
    );

--Crear tabla “libros”, con los atributos código, título, y codigoeditorial. Definir el código como llave primaria, y codigoeditorial como llave foránea, referenciando a la tabla editoriales.
CREATE TABLE IF NOT EXISTS libros (
    codigo SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    codigoeditorial INT,
    FOREIGN KEY (codigoeditorial) REFERENCES editoriales(codigo)
    );

--Insertar editoriales y libros, de acuerdo con: 
--Título                        Autor                   Editorial   Precio 
--Don Quijote de La Mancha I    Miguel de Cervantes     Anaya       150 
--El principito                 Antoine SaintExupery    Andina      120 
--El príncipe                   Maquiavelo              S.M.        180 
--Diplomacia                    Henry Kissinger         S.M.        170 
--Don Quijote de La Mancha II   Miguel de Cervantes     Anaya       140 
INSERT INTO editoriales (nombre) VALUES 
('Anaya'),
('Andina'),
('S.M.');

INSERT INTO libros (titulo, codigoeditorial) VALUES
('Don Quijote de La Mancha I',1),
('El principito',2),
('El príncipe',3),
('Diplomacia',3),
('Don Quijote de La Mancha II',1);
 
--Modificar la tabla “libros”, agregando la columna autor y precio. 
ALTER TABLE libros
ADD COLUMN autor VARCHAR(100),
ADD COLUMN precio INT;

--Agregar autor y precio a los libros ya ingresados. 
UPDATE libros SET autor = 'Miguel de Cervantes', precio = 150 WHERE codigo = 1;
UPDATE libros SET autor = 'Antoine SaintExupery', precio = 120 WHERE codigo = 2;
UPDATE libros SET autor = 'Maquiavelo', precio = 180 WHERE codigo = 3;
UPDATE libros SET autor = 'Henry Kissinger', precio = 170 WHERE codigo = 4;
UPDATE libros SET autor = 'Miguel de Cervantes', precio = 140 WHERE codigo = 5;

--Insertar 2 nuevos libros. 
INSERT INTO libros (titulo, autor, precio, codigoeditorial)
VALUES
    ('El misterio de la habitación cerrada', 'Laura Gallego', 120, 1),
    ('El arte de la guerra', 'Sun Tzu', 180, 1);

--Eliminar los libros de la editorial Anaya, solo en memoria (ROLLBACK).
BEGIN;
DELETE FROM libros WHERE codigoeditorial = 1;
ROLLBACK;

--Actualizar el nombre de la editorial Andina a Iberlibro en memoria, y actualizar el nombre de la editorial S.M. a Mountain en disco duro (SAVEPOINT / ROLLBACK TO). 
BEGIN;
SAVEPOINT update_ib;
UPDATE editoriales SET nombre = 'Iberlibro' WHERE nombre = 'Andina';
UPDATE editoriales SET nombre = 'Mountain' WHERE nombre = 'S.M.';
ROLLBACK TO SAVEPOINT update_ib;
COMMIT;
