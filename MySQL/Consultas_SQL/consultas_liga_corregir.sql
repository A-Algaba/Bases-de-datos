use liga;

-- 1

select * from jugador where equipo = 3;

-- 2

select * from jugador where posicion = "escolta" or posicion = "alero";

-- 12

select *,(salario*0.82) as salario_neto from jugador;

-- 13

select * from jugador where posicion is null;

-- 14

select * from partido where fecha < "2012-01-01";
select * from partido where year (fecha) < "2012";

-- a1

select avg(salario) as salario_medio from jugador;

-- a2

select equipo, sum(altura) as suma_alturas from jugador group by equipo having suma_alturas > 5;

-- a3

select count(*) from jugador where altura > 2;

-- a4

select equipo, posicion, count(*) as total from jugador group by equipo, posicion;

-- a5

select equipo, sum(salario) as salario_total, count(*) from jugador group by equipo having count(*) > 4;

-- a6

select count(distinct(ciudad)) from equipo;

-- a7

select equipo, max(salario), min(salario), max(salario) - min(salario) as salario_dif from jugador group by equipo;

-- a8

select equipo, avg(salario) as salario_medio_equipo from jugador group by equipo;

-- a9
select equipo, avg(salario) as salario_medio_equipo from jugador group by equipo having salario_medio_equipo > 100000;

-- a10

select equipo, count(*) as num_jugadores_equipo from jugador group by equipo;

-- a11

select equipo, avg(altura) as altura_media from jugador group by equipo;

-- a12

select * from jugador;

select equipo, sum(salario) as salario_max_equipo from jugador group by equipo;

-- a13

select equipo, avg(altura) as altura_media from jugador group by equipo having altura_media > 2.00;

-- a14

select equipo, avg(altura) as altura_maxima_equipo from jugador group by equipo;