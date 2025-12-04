use liga;

-- Ejercicio 1, mostrar datos de los partidos jugados en el mes de febrero

select * from partido where month(fecha) = 2;

-- Ejercicio 2, mostrar nombre y apellido en una sola columna llamada "Nombre completo", en mayusculas

select upper(concat(nombre, ' ', apellido)) as `Nombre Completo` from jugador;

-- Ejercicio 3, mostrar las webs de equipos que no contengan www

select web from equipo where web not like '%www%';

-- Ejercicio 4, mostrar datos de equipos cuya web incluya la palabra basket

select * from equipo where web like '%basket%';

-- Ejercicio 5, mostrar enlaces de webs de los equipos pero sin http://

select replace(web, 'http://', '') as web_sin_http from equipo;

-- Ejercicio 6, realizar consulta que devuelva esta frase, "El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posicion escolta"

select concat('El jigador con nombre y apellidos: ', nombre, ' ', apellido, 'juega en la posicion: ', posicion) as frase from jugador where nombre = 'Juan Carlos' and apellido = 'Navarro';

-- Ejercicio 7, hacer consulta de equipos con nombre de 12 caracteres o menos

select * from equipo where length(nombre) <= 12;

-- Ejercicio 8, mostrar consulta de jugadores dados de alta en 2008 o 2011

select * from jugador where year (fecha_alta) in (2008, 2011);


-- Ejercicio 9, mostrar un listado de paginas web de los equipos pero cambiando "http://" por "https://"

select replace(web, 'http://', 'https://') as web_encriptada from equipo;

-- Ejercicio 10, mostrar el nombre de los jugadores y su nombre invertido

select nombre, reverse(nombre) as nombre_invertido from jugador;

--  Ejercicio 11, mostrar los nombres de los jugadores rellenado por la izquierda hasta 20 caracteres con '*'

select lpad(nombre, 20, '*') as nombre_relleno from equipo;

-- Ejercicio 12, mostrar apellidos de los jugadores y sus 3 primeras letras

select apellido, left(apellido, 3) as primeras_3_letras from jugador;

-- Ejercicio 13, mostrar la posicion en la que aparece la letra 'a' en el nombre del equipo

select nombre, locate('a', nombre) as posicion_a from equipo;

-- Ejercicio 14, mostrar el nombre del jugador y un campo que indique, "Veterano", si fue dado de alta antes del 2010, "Moderno" si fue dado de alta a partir del 2010

select nombre, fecha_alta, case  when fecha_alta < '2010-01-01' then 'Veterano' else 'Moderno' end as categoria from jugador;

-- Ejercicio 15, mostrar datos de jugadores cuyo apellido termina en ez

select * from jugador where apellido like '%ez%';

-- Ejercicio 16, mostrar los equipos ordenados por la longitud de su nombre

select *, length(nombre) as longitud from equipo order by longitud;

-- Ejercicio 17, mostrar los nombres de los jugadores en minusculas

select lower(nombre) as nombre_minusculas from jugador;

-- Ejercicio 18, mostrar nombre de el jugador y las 2 primeras letras del apellido

select nombre, left(apellido, 2) as primeras_2 from jugador;

-- Ejercicio 19, mostrar nombre del jugador y el año de alta

select nombre, year(fecha_alta) as anio_alta from jugador;

-- Ejercicio 20, mostrar nombre y apellidos en una sola columna separados por un guion 

select concat(nombre, '-', apellido) as nombre_apellido from jugador;
