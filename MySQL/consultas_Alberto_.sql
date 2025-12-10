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

-- Parte 2

-- Ejercicio 23, Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"

select upper(concat(Nombre, " - " , Direccion)) as Nombre_completo from Clientes;

-- Ejercicio 24, Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.

select concat("Producto: ", Descripcion) as Producto_Descripcion from Productos;

-- Ejercicio 25, Extraer las tres primeras letras del nombre de cada país de fabricantes:

select left (Pais, 3) as primeras_letras from Fabricantes;

-- Ejercicio 26, Reemplazar "Calle" por "Avda." en las direcciones de cliente

select Nombre, replace(Direccion, "Calle", "Avda.") as Direccion_Modificada from Clientes;

-- Ejercicio 27, Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):

select 	N_pedido, Fecha_pedido, datediff(sysdate(), Fecha_pedido) as tabla_pedidos_dias from Pedidos;

-- Ejercicio 28, Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY):

select N_pedido, Fecha_pedido, last_day(Fecha_pedido) as ultimo_dia_mes from Pedidos;

-- Ejercicio 29, Asignar un estado personalizado a los pedidos dependiendo de su estado actual, 'Finalizado', 'Anulado' o 'En Gestión' (expresión CASE):

select N_pedido, Estado, case when Estado = "Completado" then "Finalizado" when Estado = "Cancelado" then "Anulado" else "En gestion" end as Estado_pedidos from Pedidos;

-- Ejercicio 30, Obtener los pedidos realizados en 2023.

select Fecha_pedido as pedidos_2023 from Pedidos where year(Fecha_pedido) = 2023;

-- Ejercicio 31, Elevar el precio de cada producto al cuadrado

select Id_producto, Descripcion, pow(Precio, 2) as Precio_Cuadrado from productos;

-- Ejercicio 32, Redondear el precio de cada producto a 1 decimal

select Id_producto, Descripcion, round(Precio, 1) as precio_redondeado from Productos;

-- Ejercicio 33, Extraer el año de las fechas de pedido:

select N_pedido, year(Fecha_pedido) as anio from pedidos;

-- Ejercicio 34, Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024):

select count(*) as Total_Pedidos_2024 from Pedidos where year(Fecha_pedido) = 2024;

-- Ejercicio 35, Invertir el nombre de los clientes:

select Nombre, reverse(Nombre) as nombre_cliente_inverso from Clientes;

-- Ejercicio 36, Mostrar la longitud de cada nombre de cliente

select Nombre, length(Nombre) as longitud from Clientes;

-- Ejercicio 37, Mostrar solo los 4 primeros caracteres del nombre del cliente

select Nombre, left(Nombre, 4) as Primeros_4 from Clientes;

-- Ejercicio 38 Mostrar “CARO” para productos => 500 o “BARATO” según el precio

select Descripcion, Precio, if(Precio >= 500, "CARO", "BARATO") as tabla_precios from Productos;

-- Ejercicio 39, Cantidad total de productos vendidos por cada producto

select p.Id_producto, p.Descripcion, sum(dp.Cant) as Total_Vendido from Productos p join Detalles_Pedido dp on p.Id_producto = dp.Id_producto group by p.Id_producto, p.Descripcion;

-- Ejercicio 40, Número de clientes por cada ciudad (Añade algo a la consulta para mostrar solo las ciudades que tengan más de un cliente)

select ciudad, count(*) as total_clientes from Clientes group by Ciudad having count(*) > 1;