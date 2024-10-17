-- Active: 1728748608161@@127.0.0.1@5432@dvdrental
--Se crea una ciudad y una direccion para asignar al nuevo cliente
INSERT INTO city (city, country_id) VALUES ('Coquimbo', 22);
INSERT INTO address (address, district, city_id, postal_code, phone) VALUES ('1918 Portugal','Coquimbo',601,1730000,955443322);

--Tabla Customer 
--Insert
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active) 
VALUES (2, 'Carlos', 'Duran', 'carlos.duran@sakilacustomer.org',607,1);
--Update
UPDATE customer 
    SET store_id = 2
     , first_name = 'Sharona'
     , last_name = 'Robysonn'
     , email = 'sharona.robysonn@sakilacustomer.org'
     , address_id = 83
WHERE customer_id = 20;
--Delete
DELETE FROM customer WHERE customer_id = 602;

--Tabla Staff
--Insert
INSERT INTO staff (first_name, last_name, address_id, email, store_id, username, password, picture) 
VALUES ('Charles','Ortiz',607,'Charles.Ortiz@sakilastaff.com',2,'Charles','1234',pg_read_binary_file('D:\xampp\htdocs\evaluacion\Modulo-5\final\linkedin.png'));
--Update
UPDATE staff 
    SET first_name = 'Jhon'
     , last_name = 'Trump'
     , email = 'Jhon.Trump@sakilastaff.com'
     , store_id = 1
     , username = 'Jhon'
     , password = '8765'
     , picture = pg_read_binary_file('D:\xampp\htdocs\evaluacion\Modulo-5\final\linkedin.png')
WHERE staff_id = 2;
--Delete
DELETE FROM staff WHERE staff_id = 4;

--Tabla Actor
--Insert
INSERT INTO actor (first_name, last_name) VALUES ('Keanu','Revees');
--Update
UPDATE actor 
    SET first_name = 'Kora'
     , last_name = 'Tempestad'
WHERE actor_id = 200;
--Delete
DELETE FROM actor WHERE actor_id = 201;
