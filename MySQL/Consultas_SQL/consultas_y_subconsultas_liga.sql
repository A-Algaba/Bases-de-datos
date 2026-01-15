use liga;

-- 1 el jugador mas alto de la liga

select * from jugador where altura = (select max(altura) from jugador);
select * from jugador where altura >= all(select altura from jugador);

-- 2 Datos de todos los jugadores que pertenecen al Caja Laboral.

select * from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = "Caja Laboral";

-- 3 Suma de las alturas de los jugadores que sean del CAI Zaragoza o del Real Madrid.

select e.nombre ,sum(altura) suma_altura from jugador j join equipo e on j.equipo = e.id_equipo 
group by e.nombre having e.nombre = "CAI Zaragoza" or e.nombre = "Real Madrid";

-- 4 Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.

select j.* from jugador j join equipo e on j.equipo = e.id_equipo where j.altura > 
(select j.altura from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = "Caja Laboral" order by j.altura desc limit 1);

-- version mas simple

select * from jugador where altura >(select max(altura) from jugador j 
join equipo e on j.equipo = e.id_equipo where e.nombre = "Caja Laboral"); -- subconsulta con los datos de los jugadores que midan mas que los jugadores de caja laboral

-- 5 Datos de los jugadores mejor pagado y peor pagado de la liga.

select * from jugador where salario = (select max(salario) from jugador) or
salario = (select min(salario) from jugador);

-- 6.Datos del jugador más antiguo, es decir, el que lleva más tiempo dado de alta en un equipo.

select * from  jugador where fecha_alta = (select min(fecha_alta) from jugador);

-- 7.Datos de los equipos que tienen más de tres jugadores registrados.

select count(j.id_jugador) as num_jugadores , e.id_equipo, e.nombre, e.ciudad from equipo e join jugador j on e.id_equipo = j.equipo group by e.id_equipo, e.nombre, e.ciudad having count(j.id_jugador) >= 3;

-- 8. Mostrar el nombre del jugador, el nombre del equipo al que pertenece y su posición.

select j.nombre, e.nombre, j.posicion from jugador j join equipo e on j.equipo = e.id_equipo;


-- 9. Mostrar el nombre de cada equipo y el nombre de su capitán o capitanes.

select e.nombre, j.id_capitan, j.nombre from equipo e join jugador j on e.id_equipo = j.equipo;

-- 10. Datos de los equipos y el número de partidos que han jugado como locales.

select e.*, count(p.local) as partidos_jugados_local from equipo e join partido p on e.id_equipo = p.local group by p.local;

-- 11. Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.

select * from partido p join equipo e on p.local = e.id_equipo ;

-- consultas aparte inventadas

-- Ejercicio 1: Obtener el nombre completo de todos los jugadores junto con el nombre y ciudad de su equipo.

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