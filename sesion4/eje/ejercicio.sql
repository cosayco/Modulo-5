--1) Crea una base de datos llamada empresa.
CREATE DATABASE empresa;

--2) Dentro de la base de datos empresa, crea una tabla llamada departamentos con las siguientes columnas:
/* • id (entero, clave primaria)
• nombre (cadena de caracteres, hasta 100 caracteres)
• ubicacion (cadena de caracteres, hasta 100 caracteres) */
CREATE TABLE IF NOT EXISTS departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100)
    );

--3) Crea una tabla llamada empleados con las siguientes columnas:
/* • id (entero, clave primaria)
• nombre (cadena de caracteres, hasta 100 caracteres)
• puesto (cadena de caracteres, hasta 100 caracteres)
• salario (decimal, hasta 10 dígitos enteros y 2 decimales)
• fecha_contratacion (fecha)
• departamento_id (entero, clave foránea que referencia departamentos.id) */
CREATE TABLE IF NOT EXISTS empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    departamento_id INTEGER,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
    );

--4) Modifica la tabla empleados para agregar una nueva columna llamada email que almacenará direcciones de correo electrónico (cadena de caracteres, hasta 100 caracteres).
ALTER TABLE empleados ADD COLUMN email VARCHAR(100);

--5) Cambia el nombre de la tabla empleados a trabajadores.
ALTER TABLE empleados RENAME TO trabajadores;

--6) Elimina la tabla departamentos.
DROP TABLE departamentos CASCADE;
