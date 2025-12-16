use biblioteca_consultas;

-- 1

select * from autores where nacionalidad in ("española");
select * from autores where nacionalidad = "española";

-- 2

select * from libros where año_publicacion > 2000;

-- 3

select * from libros where numero_paginas < 300;

-- 4

select * from socios where ciudad like "%madrid%";

-- 5

select * from prestamos where estado = "En prestamo";

-- 6

select * from libros order by numero_paginas desc;

-- 7

select * from autores order by fecha_nacimiento asc;

-- 8

select * from libros where titulo like "%amor%";

-- 9

select * from socios where email like "%@email.com";

-- 10
select * from prestamos;
select * from prestamos where fecha_prestamo >= "2024-04-01" and fecha_prestamo <="2024-04-30";

-- 12
select * from libros;
select max(id_libro) as total_libros from libros;

-- 13
select * from libros;
select max(numero_paginas) as libro_max_paginas from libros;

-- 42

select * from autores where nacionalidad = "Argentina" or nacionalidad = "Chilena";

-- 45

select * from libros where genero not like "%Novela%";

-- 47

select * from libros where numero_paginas < 200 or numero_paginas > 600;

-- 54

select * from autores where year(fecha_nacimiento) < 1920;