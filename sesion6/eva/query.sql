--1. Listar  todos  los  arriendos  con  las  siguientes  columnas:  Folio,  Fecha,  Días,  ValorDia, NombreCliente, RutCliente.  
SELECT a.Folio, a.Fecha, a.Días, a.ValorDia, c.Nombre, a.Cliente_RUT
FROM arriendo a
JOIN cliente c ON cliente.RUT = arriendo.Cliente_RUT;

--2. Listar los clientes sin arriendos. 

--3. Liste RUT y Nombre de las tablas empresa y cliente. 
SELECT RUT, Nombre
FROM empresa;
SELECT RUT, Nombre
FROM cliente;

--4. Liste la cantidad de arriendos por mes. 
SELECT COUNT(Folio)
FROM arriendo
WHERE 
