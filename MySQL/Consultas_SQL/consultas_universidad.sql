use universidad;

-- 1.El alumno mayor de edad

select * from persona where fecha_nacimiento = (select min(fecha_nacimiento) from persona where sexo = "M" and tipo = "alumno");

select min(fecha_nacimiento) from persona where sexo = "M" and tipo = "alumno";

-- 6. obtener las alumnas que no sean las de mayor de edad

select * from persona where fecha_nacimiento > (select min(fecha_nacimiento) from persona where sexo = "M" and tipo = "alumno");

-- 2. mostrar los datos de la asignatura cuyo id sea el mayor

select * from asignatura where id = (select max(id) from asignatura);

-- 3. Mostrar el nombre de la asignatura y el nombre de grado asociado.

select a.nombre, g.nombre from asignatura a join grado g on (g.id = a.id_grado);

-- 4. Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor asociado (incluyendo asignaturas sin profesor si las hubiera).

select per.nombre, per.apellido1, per.apellido2, a.nombre, g.nombre 
from persona per join profesor pro on (per.id = pro.id_profesor) right join asignatura a on 
(pro.id_profesor = a.id_profesor) join grado g on (a.id_grado = g.id);

select * from persona p join profesor pr on (pr.id_profesor = p.id);

select p.nombre, p.apellido1, p.apellido2, d.nombre from persona p join profesor pr on (pr.id_profesor = p.id) join departamento d on (pr.id_profesor = d.id);

-- 6 .Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.

select per.nombre, per.apellido1, per.apellido2, d.nombre from profesor pro join persona per on (per.id = pro.id_profesor) 
join departamento d on (pro.id_departamento = d.id);

-- 7.Saca todos los datos de los grados que tengan o no asignaturas asignadas.

select * from grado g  left join asignatura a on (g.id = a.id_grado);

select * from asignatura a right join grado g on (g.id = a.id_grado);

-- 8. saca todas las asignaturas tengan o no profesores

select * from asignatura a left join profesor p on (a.id_profesor = p.id_profesor);