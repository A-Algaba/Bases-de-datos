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

-- 29
select * from jugador;
select equipo, sum(salario) as salario_medio_equipo from jugador group by equipo; -- estoy diciendo que de la columna equipo sume el salario, de la tabla jugador y lo agrupe por equipo

-- ejercicios inventados 

-- 1

select * from equipo where ciudad = "madrid";

-- 2

select * from jugador where posicion = "pivot";

-- 3

select * from jugador where salario > 100000;

-- 4

select * from equipo order by puntos desc;

-- 5

select * from jugador order by altura desc;

-- 6

select * from partido where arbitro = 2;

-- 7

select * from jugador where nombre like "C%";

-- 11
select * from jugador;
select max(id_jugador) as maximo_jugadores from jugador;

-- 12

select avg(salario) as salario_promedio_jugadores from jugador;

-- 13

select max(salario) as salario_maximo_jugadores from jugador;

-- 14

select min(salario) as salario_minimo_jugadores from jugador;

-- 16

select sum(puntos) as total_puntos_equipo from equipo;

-- 17

select sum(salario) as total_salario_jugadores from jugador;

-- 21

select equipo, count(*) from jugador group by equipo;

-- 22

select equipo, avg(salario) as salario_por_equipo from jugador group by equipo;

-- 23

select posicion, count(*) as posicion_jugadores_cantidad from jugador group by posicion;

-- 53

select id_jugador, nombre, salario,case when 
salario > 100000 then "alto" 
when salario between 60000 and 100000 then "medio" 
when salario < 60000 then "bajo" end as comparativa_sueldos from jugador;

-- 54 
select * from equipo;

select id_equipo, nombre, case 
when puntos > 10 then "lider" 
when puntos between 10 and 20 then "medio"
when puntos < 10 then "bajo" end as comparativa_puntos from equipo; -- IMPORTANTE CUANDO SON VALORES DE TEXTO O STRING, SE PONE " "

-- 56

select id_equipo, nombre, web, case
when web like "%web%" then "diferentes"
when web not like "%web%" then "no es diferente"
end as comparativa_web from equipo;

-- 48

select concat(nombre, " - ", apellido) as nombres_y_apellidos from jugador;

-- 49

select upper(nombre) as nombre_mayus from equipo;

-- 50

select nombre ,length(nombre) as caracteres_num_nombre_jugador from jugador;

-- 51

select concat("El equipo ", nombre, " tiene ", puntos, " puntos") as tabla_personalizada from equipo;

-- 52

select lower(apellido) as apellidos_minusculas from jugador;

-- 38

select * from partido where month(fecha) = 11;

-- 36

select * from jugador where year(fecha_alta) = 2011;

-- 37

select year(fecha_alta) as anio, count(*) as total_jugadores from jugador group by year(fecha_alta) order by anio desc;

-- 40

select * from partido;
select month(fecha) as meses_partido, year(fecha) as anio_partidos, count(*) total_partidos from partido 
group by meses_partido, anio_partidos;

select id_jugador, nombre, posicion, case
when posicion = "pivot" or posicion = "ala-pivot" then "interior"
when posicion = "base" or posicion = "escolta" or posicion = "alero" then "exterior"
when posicion is null then "desconocido"
end as categoria_simplificada from jugador;

-- 34
select * from jugador;
select id_jugador, nombre, salario, round(salario / 12, 2) as salario_mensual from jugador;

-- 70

select equipo, count(*) as numero_jugadores from jugador group by equipo order by numero_jugadores desc limit 1;