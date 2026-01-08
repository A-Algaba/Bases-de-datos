use profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;

-- 1.Muestra los datos de la asignatura y el dni del profesor que la imparte

select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo = i.asignatura;
select * from asignaturas a, imparte i where a.codigo = i.asignatura;

-- 2.Muestra los datos de los profesores que imparten alguna asignatura

select * from profesores p join imparte i on p.dni = i.dni order by ingreso desc;

-- 3 lo mismo pero con natural join

select * from profesores natural join imparte; -- esta pensado para no duplicar mismos datos en una tabla por ejemplo, el dni

-- Producto cartesiano (CROSS JOIN)
select * from profesores, asignaturas;
select * from profesores cross join asignaturas;

-- 4.Suma de creditos que imparte el profesor segun su dni

select i.dni, sum(a.creditos) as suma_total_creditos from asignaturas a join imparte i on a.codigo = i.asignatura group by i.dni;

-- 5.Mostrar el nombre de los profesores que imparten alguna asignatura

select p.nombre, a.descripcion from profesores p join imparte i on p.dni = i.dni
join asignaturas a on a.codigo = i.asignatura;

select nombre, count(*) num_asignaturas_imparte from profesores p join imparte i on p.dni = i.dni group by i.dni; -- opcion mas correcta

select * from profesores natural join imparte i join asignaturas a on a.codigo = i.asignatura; -- opcion con natural join

-- 6.Mostrar el nombre del profesor y la descripcion de la asignatura que imparte

select * from profesores p join imparte i on p.dni = i.dni 
join asignaturas a on a.codigo = i.asignatura;