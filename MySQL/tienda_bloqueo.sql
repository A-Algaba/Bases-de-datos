drop database if exists tienda_bloqueo;
create database tienda_bloqueo;
use tienda_bloqueo;

create table productos (
	id int primary key,
    nombre varchar(100),
    stock int
);

insert into productos(id, nombre, stock) values 
(1, "Teclado", 10),
(2, "Raton", 20),
(3, "Monitor", 5);

select * from productos;

-- 1. NIVEL DE BLOQUEO DE TABLA
-- si una consola bloquea una tabla, la otra no puede trabajar con esa tebla

start transaction;

lock tables productos write;

select * from productos;

update productos set stock = stock - 5 where nombre = "Raton";

unlock tables;

commit;

-- 2.NIVEL DE BLOQUEO: BLOQUEO DE FILA 
-- Ahora no se bloquea todo, solo se bloquea una fila, es decir, si bloqueas el producto 1, el producto 2 puedes modificarlo

start transaction;

update productos set stock = stock - 1 where id = 1;

select * from productos;

commit;

-- 3.TIPO DE BLOQEUO: BLOQEUO COMPARTIDO
-- varios pueden leer, nadie puede modificar mientras dure el bloqueo

start transaction;
select * from productos where id = 1 lock in share mode;

-- has ledio el producto 1, pero ademas lo dejas protegido para que nadie lo modifique

update productos set stock = stock - 1 where id = 1;

commit;