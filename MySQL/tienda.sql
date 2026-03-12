create database tienda;

use tienda;

-- Creamos la tabla fabricante

create table fabricantes (
	clave_fabricante int,
    nombre varchar(30)
);

create table articulos(
	clave_articulo int auto_increment primary key,
    nombre varchar(50),
    precio decimal(8,2),
    clave_fabricante int,
    existencias int
);

alter table fabricantes add constraint pk_fabricantes primary key(clave_fabricante);

alter table articulos add constraint fk_articulo_fab foreign key (clave_fabricante) references fabricantes (clave_fabricante);

show tables;
describe articulos;

insert into fabricantes (clave_fabricante, nombre) values 
(1, "kingston"), 
(2, "Adata"), 
(3, "Logitech"), 
(4, "Lexar"), 
(5,"Seagate");

select * from fabricantes;

insert into articulos (nombre, precio, clave_fabricante,existencias) values
("Teclado", 65.75, 3, 250), 
("Disco duro 2 TB", 250.50, 5, 275), 
("Mouse", 37.75, 3, 300), 
("Memoria USB", 14.50, 4, 25), 
("Memoria RAM", 230.76, 1, 10), 
("Disco duro extraible 250Gb", 350.000, 5, 30), 
("Memoria USB", 29.75, 1, 120), 
("DVD Rom", 25.40, 2, 56), 
("CD Rom", 15.50, 2, 80), 
("Tarjeta de red", 18.45, 3, 120);

select * from articulos a join fabricantes f on (a.clave_fabricante = f.clave_fabricante);

select * from articulos natural join fabricantes;

-- realizar inserciones

insert into articulos(nombre, precio, clave_fabricante, existencias) values
("Altavoces", 120.00, 6, 9);

-- usar esta sentencia para desactivar temporalmente el modo de actualizacion segura

set SQL_SAFE_UPDATES = 0;

-- realizar modificaciones en los datos

update articulos set nombre="HD extraíble 250 Gb" where nombre="Disco duro extraible 250Gb";

update articulos set existencias = existencias + 5 where nombre = "Memoria RAM";

update articulos set existencias = existencias - 20 where clave_fabricante = 3;

update articulos set precio = precio * 0.9;

update articulos set precio = precio - 10 where precio <= 200;

update articulos set clave_fabricante = 1 where nombre = "DVD Rom";

update articulos set existencias = 0 where precio < 20;

-- 8.

delete from articulos where nombre = "CD Rom";

delete from articulos where existencias < 10;

delete from articulos where clave_fabricante = 4;

delete from fabricantes where nombre = "Seagate";

-- para eliminar el fabricante seagate primero debemos eliminar la clave foranea y crearla de nuevo para ponerle la palabra clave on delete set null

-- la sentencia on delete set null, permite borrar los datos que cuyas columnas pertenecientes tiene una clave foranea
-- es decir que si se borra un dato de clave foranea se pondria en todos esos datos borrados null
-- con on delet set cascade se borrarian todos los datos de la clave foranea sin poner nada de nul, eliminaria los datos

alter table articulos drop foreign key fk_articulo_fab;

alter table articulos add constraint fk_articulo_fab foreign key (clave_fabricante) references fabricantes (clave_fabricante) on delete set null on update cascade;

update articulos set clave_fabricante = 6 where clave_fabricante = 2;

-- 9.

update fabricantes set clave_fabricante = 99 where clave_fabricante = 6;

insert into articulos (nombre, precio, clave_fabricante, existencias) values ("auriculares", 500, 99, 5);

update articulos set clave_fabricante = 99 where clave_fabricante = 1;

delete from articulos where clave_fabricante = 99;

-- consulta para comprobar los cambios realizados

select * from articulos;

select * from fabricantes;