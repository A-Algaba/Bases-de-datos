use TiendaTecnologia;

-- 1 Nombre: Alberto Algaba Calderón

select * from productos order by precio desc; -- esta bien

-- 2 Nombre: Alberto Algaba Calderón

select * from pedidos where estado like "%pendiente%";

-- esta mejor si se hace

select * from pedidos where estado = "pendiente";

-- 3 Nombre: Alberto Algaba Calderón

select precio, count(*) as Productos_caros from productos group by precio having precio > 500;

--  corregido

select count(precio) as productos_caros from productos where precio > 500;

-- 4 Nombre: Alberto Algaba Calderón

select nombre, telefono from clientes where telefono like "%56"; -- esta bien

-- 5 Nombre: Alberto Algaba Calderón

select distinct(estado) as estados_pedidos_no_repetir from pedidos; -- esta bien

-- 6 Nombre: Alberto Algaba Calderón

select * from pedidos where month(fecha_pedido) = 01; -- esta bien

-- 7 Nombre: Alberto Algaba Calderón

select upper(concat(direccion, " - ", ciudad)) as Ubicacion, id_cliente ,upper(nombre) from clientes; -- esta bien

-- 8 Nombre: Alberto Algaba Calderón

select * from pedidos order by date(fecha_pedido) asc limit 1;

-- esta mejor si

select min(fecha_pedido) as pedido_mas_antiguo from pedidos;

-- 9 Nombre: Alberto Algaba Calderón

select pais, count(*) as pais_por_fabricante from fabricantes group by pais; -- esta bien

-- 10 Nombre: Alberto Algaba Calderón

select * from productos where precio between 200 and 800; -- esta bien

-- 11 Nombre: Alberto Algaba Calderón

select * from productos order by precio desc limit 1; -- esta bien

-- 12 Nombre: Alberto Algaba Calderón

select round(precio, 0) as Precio_redondeado from productos; -- esta bien

-- 13 Nombre: Alberto Algaba Calderón

-- se hace asi

select id_fab, sum(existencias) as existencias from productos group by id_fab having existencias >= 30;

-- 14 Nombre: Alberto Algaba Calderón

select id_producto, descripcion, existencias , precio, case 
when existencias >= 30 then "muchas" 
when existencias < 10 then "pocas" 
else "suficientes" end as rango_existencias_productos from productos; -- esta bien

-- 15

select id_categoria, sum(existencias) as suma_existencias from productos group by id_categoria having suma_existencias >= 50;  -- esta bien

-- 16 Nombre: Alberto Algaba Calderón

select metodo_pago, count(*) as metodo_pago_cantidad from pedidos group by metodo_pago; -- esta bien