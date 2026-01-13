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