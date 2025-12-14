use biblioteca_consultas;

-- 1

select * from libros where año_publicacion >= 2000;

-- 2

select nombre, ciudad from socios where ciudad like "%madrid%";

-- 3

select nombre, nacionalidad from autores where nacionalidad like "%argentina%";


-- 5

select genero, count(*) as num_generos from libros group by genero;

-- 6

select * from prestamos where fecha_devolucion_real > fecha_devolucion_prevista;

-- 7

select * from libros where numero_paginas >= 500;