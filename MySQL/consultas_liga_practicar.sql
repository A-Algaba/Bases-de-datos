use liga;

-- 1

select * from jugador where equipo = "3" order by apellido;

-- 2

select * from jugador where posicion = "escolta" or posicion = "alero";

-- 3

select * from jugador where salario between 60000 and 100000; -- poner en un numero un punto es poner decimales

-- 4 

select * from jugador where posicion = "pivot"  order by id_jugador;

-- 5

select * from jugador where altura >= "2.00" and salario >= "50000";

-- 6

select *  from jugador where posicion = "pivot" and salario >= "100000";

-- 7

select nombre, equipo from jugador;
select * from jugador where posicion = "base" and equipo in (1,2);

-- 8

select * from jugador where salario >= "80000" and equipo in (1,2);

-- 9

select distinct posicion from jugador;

-- 10

select nombre, altura from jugador;
select * from jugador order by altura desc limit 5; 

-- 11
select nombre, salario from jugador;
select id_jugador, nombre, posicion, salario * 0.82 as SALARIO_NETO from jugador;

-- 12

select * from jugador where salario >= "70000";

-- 13

select * from jugador where posicion is null;

-- 14

select fecha, date(2012-01-01) as partido_jugados from partido;

-- 15

select * from jugador where salario >= "100000" and altura >= "1.90";

-- 1

select avg(salario) as slario_medio from jugador;

-- 13

select equipo, max(altura) as altura_maxima from jugador group by equipo;

-- 14

select * from partido where month(fecha) = 2;

-- 15

select upper(concat(nombre, " - " ,apellido)) as nombre_completo from jugador;

-- 16

select * from equipo where web not like "%www%";

-- 17

select * from equipo where web like "%basket%";

-- 18

select replace(web ,"http://", "") as web_sin_https from equipo;

-- 19

select concat("El nombre y apellidos del jugador: ", nombre, " ", apellido, "juega en la posicion: ", posicion) as tabla_personalizada from jugador;

-- 20

select * from equipo where length(nombre) <= 12;

-- 21

select * from jugador where year(fecha_alta) in (2008, 2011);

-- 22

select replace(web, "http://", "https://") as web_segura from equipo;

-- 23

select nombre, reverse(nombre) as nombre_invertido from jugador;

-- 24

select nombre, apellido, fecha_alta, case when fecha_alta < 2010-01-01 then "veterano" else "moderno" end as categoria from jugador;

-- 25

select concat(nombre, "-", apellido) as nombre_apellidos from jugador;

-- 26

select * from jugador where apellido like "%ez%";

-- 27
select lower(nombre) as nombre_minusculas from jugador;

-- 28

select nombre, fecha_alta, year(fecha_alta) as fecha_alta_jugadores from jugador;
