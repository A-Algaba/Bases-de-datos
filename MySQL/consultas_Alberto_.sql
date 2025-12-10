use TiendaTecnologia;

-- Ejercicio 1, listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
-- Alberto Algaba

select Id_fab, Id_categoria, Descripcion, Precio from productos;

-- Ejercicio 2, listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
-- Alberto Algaba

select * from Clientes where Id_cliente = 2;

-- Ejercicio 3, Consultar todos los datos de los productos de más de 100 €.
-- Alberto Algaba

select * from Productos where Precio > 100;

-- Ejercicio 4, listado de clientes de Madrid o Barcelona.
-- Alberto Algaba

select * from Clientes where Ciudad = "Madrid" or ciudad = "Barcelona";

-- Ejercicio 5, Obtener el precio medio de los productos del fabricante con id_fab = '1'.
-- Alberto Algaba

select avg(Precio) as precio_medio from Productos where Id_fab = "1";

-- Ejercicio 6, Consultar la fecha del pedido más antiguo.
-- Alberto Algaba

select min(Fecha_pedido) as pedido_mas_antiguo from pedidos;

-- Ejercicio 7, listado de paises sin repetir.
-- Alberto Algaba

select distinct Pais from Fabricantes;

-- Ejercicio 8, Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
-- Alberto Algaba

select * from Pedidos where Fecha_pedido between "2024-01-01" and "2024-02-05";

-- Ejercicio 9, Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
-- Alberto Algaba

select Nombre, concat(Direccion, " - ", Ciudad) as Direccion_completa from Clientes;

-- Ejercicio 10, Muestra cuantos fabricantes hay en cada país.
-- Alberto Algaba

select Pais, count(*) as Total_frabricantes from Fabricantes group by Pais;

-- Ejercicio 11, Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%.
-- Alberto Algaba

select *, Precio * 1.21 as Precio_con_IVA from Productos;

-- Ejercicio 12, Producto más caro.
-- Alberto Algaba

select * from Productos order by Precio desc limit 1;

-- Ejercicio 13, Cliente con más pedidos.
-- Alberto Algaba

select Id_cliente, count(*) as Total_Pedidos from Pedidos group by Id_cliente order by Total_Pedidos desc limit 1;

-- Ejercicio 14, Mostrar los productos ordenados por precio de mayor a menor.
-- Alberto Algaba

select * from Productos order by Precio desc;

-- Ejercicio 15, Mostrar los clientes ordenados por ciudad alfabéticamente.
-- Alberto Algaba

select * from Clientes order by Ciudad asc; 

-- Ejercicio 16, Mostrar solo los 5 productos más baratos.
-- Alberto Algaba

select * from Productos order by Precio limit 5;

-- Ejercicio 17, Mostrar cuántos productos hay por fabricante.
-- Alberto Algaba

select Id_fab, count(*) as Total_Productos from Productos group by Id_fab;

-- Ejercicio 18, Mostrar solo los fabricantes que tengan más de 1 producto.
-- Alberto Algaba

select Id_fab, count(*) as Total_productos from Productos group by Id_fab having count(*) > 1;

-- Ejercicio 19, Mostrar clientes cuyo nombre empiece por “A”.
-- Alberto Algaba

select * from Clientes where nombre like "A%";

-- Ejercicio 20, Mostrar productos cuyo nombre contenga la palabra “Portátil”.
-- Alberto Algaba

select * from Productos where Descripcion like "%portatil%";

-- Ejercicio 21, Convertir nombres de clientes a mayúsculas.

select upper(Nombre) from Clientes;

-- Ejercicio 22, Convertir descripciones de productos a minúsculas.

select lower(Descripcion) from Productos;

select lower(Descripcion) from Productos;

-- Practica por terminar,  esto  ya es por mi cuenta

-- Ejercicio 23, Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"

select nombre, direccion as Nombre_completo from Clientes;

select upper(concat(Nombre, " - " , Direccion)) as Nombre_completo from Clientes;

-- Ejercicio 24, Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.

select concat("Producto: ", Descripcion) as Producto_Descripcion from Productos;

-- Ejercicio 25, Extraer las tres primeras letras del nombre de cada país de fabricantes:

select left (Pais, 3) as primeras_letras from Fabricantes;

-- Ejercicio 26, Reemplazar "Calle" por "Avda." en las direcciones de cliente

update Clientes set Direccion = replace(Direccion, "Calle", "Avda.") where Direccion like "Calle%" and Id_cliente;

select Direccion as datos_modificados from Clientes;

-- Ejercicio 27, Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):

select sysdate();

-- Ejercicio 30, Obtener los pedidos realizados en 2023.

select Fecha_pedido as pedidos_2023 from Pedidos where year(Fecha_pedido) = 2023;

-- Ejercicio 38 Mostrar “CARO” para productos => 500 o “BARATO” según el precio

select Descripcion, Precio, if(Precio >= 500, "CARO", "BARATO") as tabla_precios from Productos;