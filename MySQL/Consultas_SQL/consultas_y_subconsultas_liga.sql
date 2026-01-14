use liga;

-- 1 el jugador mas alto de la liga

select * from jugador;

select id_jugador,nombre, apellido, posicion ,max(altura) as altura_maxima 
from jugador group by id_jugador order by id_jugador asc limit 1;

-- 2 Datos de todos los jugadores que pertenecen al Caja Laboral.

select * from jugador j join equipo e on j.id_jugador = e.id_equipo where e.nombre = "Caja Laboral";

-- 3 Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.

select e.nombre ,sum(altura) from jugador j join equipo e on j.id_jugador = e.id_equipo 
group by id_jugador order by j.altura;

-- 4 Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.

select *, sum(altura) as altura_mayor_caja_laboral from jugador j left join equipo e on (j.id_jugador = e.id_equipo) group by id_jugador;

-- 5 Datos de los jugadores mejor pagado y peor pagado de la liga.

select * from jugador where salario > (select salario from jugador where id_jugador and nombre);

-- consultas aparte inventadas

-- Ejercicio 1: Obtener el nombre completo de todos los jugadores junto con el nombre y ciudad de su equipo.

select j.nombre ,e.nombre, e.ciudad from jugador j join equipo e on j.id_jugador = e.id_equipo;

-- CORRECCIÓN:
select j.nombre, j.apellido, e.nombre, e.ciudad 
from jugador j 
join equipo e on j.equipo = e.id_equipo;

-- Ejercicio 2: Mostrar todos los partidos con los nombres de los equipos local y visitante, el resultado y la fecha.

select p.local, p.visitante, p.resultado, p.fecha, e.nombre as nombres_equipos from partido p join equipo e on p.id_partido = e.id_equipo;

-- Ejercicio 3: Listar los jugadores que juegan en equipos de Madrid o Barcelona, mostrando nombre del jugador, equipo y ciudad.

select j.nombre, e.nombre, e.ciudad from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = "real madrid" or e.nombre = "regal barcelona";

-- Ejercicio 4: Obtener los jugadores con salario superior a 100000, mostrando su nombre, salario y el nombre de su equipo.

select j.nombre, j.salario, e.nombre from jugador j join equipo e on j.id_jugador = e.id_equipo where j.salario > 100000;

-- Ejercicio 5: Mostrar los partidos jugados en 2012 con los nombres de ambos equipos y el árbitro.

select e.nombre, p.arbitro, p.fecha from partido p join equipo e on p.id_partido = e.id_equipo where year(p.fecha) = 2012;

select * from jugador;