use tienda_online;

-- 1

select * from productos where categoria like "%electronica%";

-- 2

select * from productos where precio > 100;

-- 3

select * from productos where stock < 50;

-- 4

select * from productos order by precio desc;

-- 5

select * from clientes where edad > 35;

-- 6

select avg(precio) as precio_promedio_productos from productos;

-- 7

select max(precio) as precio_maximo_producto from productos;

-- 8

select min(precio) as precio_minimo_producto from productos;

-- 9

select max(id_producto) as total_productos from productos; -- cuando se hablaa de saber el maximo total de algo, se usa max, con el id de algo o lgo que sea numerico, en este caso el id_producto

-- 10

select sum(stock) as total_stock_suma from productos;

-- 11

select avg(edad) as promedio_edad_clientes from clientes;

-- 12

select avg(total_gastado) as total_gatado_clientes from clientes;

-- 13

select categoria, count(*) as productos_por_categoria from productos group by categoria;

-- 14

select categoria, avg(precio) as precio_promedio_por_categoria from productos group by categoria;

-- 15

select categoria, max(stock) as stock_categoria from productos group by categoria; -- cuando e habla de maximo o total se pone MAX()

-- 16

select metodo_pago, count(*) as ventas_con_diferentes_metodos_pago from ventas group by metodo_pago;

-- 17

select ciudad, count(*) as num_clientes_ciudad from clientes group by ciudad;

-- 18

select ciudad_envio, sum(cantidad) as ventas_por_ciudad from ventas group by ciudad_envio;

-- 19

select id_producto, nombre, categoria, precio, descuento, (precio - precio * descuento / 100) as precio_final from productos;

-- 20

select id_producto, nombre, categoria, precio, descuento, (precio - precio * descuento / 100) 
as precio_final, round(precio, 2) from productos;

-- 21

-- 22

select * from productos where year(fecha_lanzamiento) = 2024 and month(fecha_lanzamiento) = 05;

-- 23

select * from clientes where year(fecha_registro) = 2023;

-- 24

select * from productos where precio between 50 and 150;

-- 25

select * from productos where categoria = "ropa" or categoria = "calzado";

-- 26

select * from productos where descuento > 0 and stock > "100";

-- 27

select * from productos where precio not between 100 and 200;

-- 29

select * from clientes where ciudad = "madrid" or ciudad = "barcelona" or ciudad = "valencia";

-- 30

select concat(nombre, " - ", apellido) as nombre_y_apellidos from clientes;

-- 31

select upper(nombre) as productos_mayusculas from productos;

-- 32

select nombre ,length(nombre) as caracteres_num_productos from productos; -- los espacios tambien los cuenta

-- 33

select categoria, count(*) as ventas_categoria from productos group by categoria;

-- 34

select * from clientes;

select ciudad, count(id_cliente) as ciudad_por_clientes from clientes group by ciudad having count(id_cliente) > 2;