use TiendaTecnologia;

-- 1 Nombre: Alberto Algaba Calderón

select * from productos order by precio desc;

-- 2 Nombre: Alberto Algaba Calderón

select * from pedidos where estado like "%pendiente%";

-- 3 Nombre: Alberto Algaba Calderón

select precio, count(*) as Productos_caros from productos group by precio having precio > 500;

-- 4 Nombre: Alberto Algaba Calderón

select nombre, telefono from clientes where telefono like "%56";

-- 5 Nombre: Alberto Algaba Calderón

select distinct(estado) as estados_pedidos_no_repetir from pedidos;

-- 6 Nombre: Alberto Algaba Calderón

select * from pedidos where month(fecha_pedido) = 01;

-- 7 Nombre: Alberto Algaba Calderón

select upper(concat(direccion, " - ", ciudad)) as Ubicacion, id_cliente ,upper(nombre) from clientes; 

-- 8 Nombre: Alberto Algaba Calderón

select * from pedidos order by date(fecha_pedido) asc limit 1;

-- 9 Nombre: Alberto Algaba Calderón

select pais, count(*) as pais_por_fabricante from fabricantes group by pais;

-- 10 Nombre: Alberto Algaba Calderón

select * from productos where precio between 200 and 800;

-- 11 Nombre: Alberto Algaba Calderón

select * from productos order by precio desc limit 1;

-- 12 Nombre: Alberto Algaba Calderón

select round(precio, 0) as Precio_redondeado from productos;

-- 13 Nombre: Alberto Algaba Calderón


-- 14 Nombre: Alberto Algaba Calderón

select id_producto, descripcion, existencias , precio, case 
when existencias >= 30 then "muchas" 
when existencias < 10 then "pocas" 
else "suficientes" end as rango_existencias_productos from productos;

-- 15

select id_categoria, sum(existencias) as suma_existencias from productos group by id_categoria having suma_existencias >= 50;

-- 16 Nombre: Alberto Algaba Calderón

select metodo_pago, count(*) as metodo_pago_cantidad from pedidos group by metodo_pago;