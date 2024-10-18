CREATE TABLE IF NOT EXISTS Empresa (
    RUT VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(120),
    Direccion VARCHAR(120),
    Telefono VARCHAR(15),
    Correo VARCHAR(80),
    Web VARCHAR(50)
    );

CREATE TABLE IF NOT EXISTS Herramienta (
    IDHerramienta SERIAL PRIMARY KEY,
    Nombre VARCHAR(120),
    PrecioDia INTEGER
    );

CREATE TABLE IF NOT EXISTS Cliente (
    RUT VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(120),
    Correo VARCHAR(80),
    Direccion VARCHAR(120),
    Celular VARCHAR(15)
    );

CREATE TABLE IF NOT EXISTS Arriendo (
    Folio SERIAL PRIMARY KEY,
    Fecha DATE,
    Dias INT,
    ValorDia INTEGER,
    Garantia VARCHAR(30),
    Herramienta_IDHerramienta INTEGER,
    Cliente_RUT VARCHAR(10),
    FOREIGN KEY (Herramienta_IDHerramienta) REFERENCES Herramienta(IDHerramienta),
    FOREIGN KEY (Cliente_RUT) REFERENCES Cliente(RUT)
    );

--Se solicita crear las siguientes sentencias SQL:
--1. Inserte los datos de una empresa.
INSERT INTO Empresa (RUT, Nombre, Direccion, Telefono, Correo, Web)
VALUES ('55555555-5', 'Somidac', 'Avenida Siempreviva 123', '+56969696969', 'ventas@somidac.com', 'www.somidac.com');

--2. Inserte 5 herramientas.
INSERT INTO Herramienta (Nombre, PrecioDia)
VALUES
    ('Martillo Neumático', 2500),
    ('Taladro Percutor', 2000),
    ('Sierra Circular', 1800),
    ('Amoladora Angular', 1500),
    ('Soldadora MIG', 3000);

--3. Inserte 3 clientes.
INSERT INTO Cliente (RUT, Nombre, Correo, Direccion, Celular)
VALUES
    ('11111111-1', 'Juan Pérez', 'juanperez@gmail.com', 'Calle Fuenzalida 123', '+56912345678'),
    ('22222222-2', 'María López', 'marialopez@gmail.com', 'Avenida Balmaceda 456', '+56987654321'),
    ('33333333-3', 'Pedro Gómez', 'pedrogomez@gmail.com', 'Pasaje Monasterio 789', '+56955555555');

--4. Elimina el último cliente.
DELETE FROM Cliente WHERE RUT = '33333333-3';

--5. Elimina la primera herramienta.
DELETE FROM Herramienta WHERE IDHerramienta = 1;

--6. Inserte 2 arriendos para cada cliente.
INSERT INTO Arriendo (Fecha, Dias, ValorDia, Garantia, Herramienta_IDHerramienta, Cliente_RUT)
VALUES
    ('2023-11-20', 3, 2000, 'Efectivo', 1, '11111111-1'),
    ('2023-11-25', 5, 1500, 'Tarjeta', 2, '11111111-1'),
    ('2023-11-22', 4, 2500, 'Cheque', 1, '22222222-2'),
    ('2023-11-28', 2, 1800, 'Tarjeta', 2, '22222222-2');

--7. Modifique el correo electrónico del primer cliente.
UPDATE Cliente 
SET Correo = 'nuevo_correo@ejemplo.com'
WHERE RUT = '11111111-1';

--8. Liste todas las herramientas.
SELECT * FROM Herramienta;

--9. Liste los arriendos del segundo cliente.
SELECT * FROM Arriendo WHERE Cliente_RUT = '22222222-2';

--10. Liste los clientes cuyo nombre contenga una a.
SELECT * FROM Cliente WHERE nombre LIKE '%a%';

--11. Obtenga el nombre de la segunda herramienta insertada.
SELECT nombre FROM Herramienta WHERE IDHerramienta = 2;

--12. Modifique los primeros 2 arriendos insertados con fecha 15/01/2020.
UPDATE Arriendo SET Fecha = '2020/01/15' WHERE Folio in (1,2);

--13. Liste Folio, Fecha y ValorDia de los arriendos de enero del 2020.
SELECT Folio, Fecha, ValorDia FROM Arriendo WHERE Fecha BETWEEN '2020/01/01' AND '2020/01/31';