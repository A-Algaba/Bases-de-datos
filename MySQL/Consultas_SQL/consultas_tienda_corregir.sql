use TiendaTecnologia;

select id_fab, id_producto, descripcion, precio from productos; -- no influye mayusculas y minusculas

-- 2
select * from  pedidos where id_cliente = 2; -- no influye poner comillas simples dobles o sin comillas

-- 3

select * from productos where precio > 100;

-- 4

select * from clientes where ciudad = "Madrid" or ciudad = "Barcelona"; -- los datos a encontrar si se pone las comillas dobles
select * from clientes where ciudad in("Madrid" ,"Barcelona");

-- 5
select avg(precio) as precio_medio from productos where existencias >= 10;
select avg(precio) from productos where id_fab = 1;

-- 6

select min(fecha_pedido) from pedidos;
select * from pedidos order by fecha_pedido asc limit 2;

-- 7

select distinct(pais) from fabricantes;
select pais, count(pais) from fabricantes group by pais;

-- 8

select * from pedidos where fecha_pedido between "2024-01-01" and "2024-02-05";

-- 9

select concat(direccion, " - ", ciudad, "y su nombre es ", nombre) as concatenacion from clientes;

-- 10

select pais, count(*) as total from fabricantes group by pais;

-- 11

select *, (precio * 1.21) as precio_con_iva from productos;

-- 12

select max(precio) as producto_mas_caro from productos;

-- 13

select * from pedidos;
select id_cliente,count(*) from pedidos group by id_cliente;

-- 17

select * from productos;
select id_categoria, count(*) as cantidad from productos group by id_categoria having cantidad >=2; -- en el group by tiene que coincidir con la columna seleccionada, para poder contar cuantas veces aparece el id_categoria, es decir se cuenta cuantas veces se repite, y que se agrupe por ello

-- having es lo mismo que where solo que funciona despues de poner group by, despues de un group by no se pone where porque da error, se pone having
-- En este caso el count cuenta por cada columna del id_categoria pero si pones count(id_categoria) tambien es lo mismo que un *

-- 19

select * from clientes where nombre like "A%";

-- 20

select * from productos where descripcion like "%Portatil%";

-- 21

select upper(nombre) from clientes;

-- 23

select upper(concat(direccion, " - ", ciudad)) as calles_mayus from clientes;

-- 24

select concat("Producto: ", descripcion) as producto_descripccion from productos;

-- 25

select * from fabricantes;
select pais, substr(pais,1,2) from fabricantes;
select pais, left(pais,3) as codigo from fabricantes;

-- ambas opciones son validas

-- 26

select nombre ,replace(direccion, "Calle", "avenida") from clientes;

-- 27

select n_pedido, fecha_pedido, datediff(sysdate(),fecha_pedido) as dias_desde_ from pedidos;

-- 28

select n_pedido, fecha_pedido, last_day(fecha_pedido) as ultimo_dia from pedidos;

-- 29

select * from pedidos;

select n_pedido, estado, case when estado = "completado" then "finalizado" when estado = "cancelado" then "anulado" end as estado_personalizado from pedidos;

-- el end es para finalizar un caso/condicional de consultas

-- 30

select * from pedidos where year(fecha_pedido) = 2023;

-- 31

select *, pow(precio,2) as precio_elevado from productos;

-- pow calcula potencias elevandolas al cuadrado

-- 32

select *, round(precio, 1) as precio_redondeado from productos;

-- 33

select n_pedido, year(fecha_pedido) from pedidos;

-- 34

select count(*) from pedidos where year(fecha_pedido) = 2024;

-- 35

select nombre, reverse(nombre) from clientes;

-- 36

select nombre, length(nombre) from clientes where length(nombre) >= 10;

-- 38

select descripcion, precio, case when precio >= 500 then "CARO" else "BARATO" end as clasificacion from productos;

-- 39

select id_producto, sum(cant) as suma from detalles_pedido group by id_producto having suma >= 2;

-- 40
insert into clientes (nombre, direccion, ciudad, telefono, email) values 
('Alberto Algaba', 'Calle Huelma', 'Madrid', '3857857484', 'aac0077@alu.medac.es');
select ciudad, count(*) as cantidad from clientes group by ciudad having cantidad >= 2; -- decir agrupacion o agrupar = usar group by;