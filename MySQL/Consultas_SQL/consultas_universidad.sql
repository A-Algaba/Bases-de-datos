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

/*===========================================================================================================================================================================*/

-- Consultas inventadas

-- 1. Muestra el nombre de cada asignatura junto con el nombre del grado al que pertenece.

select a.nombre, g.nombre from asignatura a join grado g on (a.id_grado = g.id);

-- 2.Lista el nombre completo de cada profesor junto con el nombre de su departamento.

select per.nombre as nombre_profesor, d.nombre as nombre_departamento from departamento d join profesor pro on (pro.id_profesor = d.id) join persona per on (pro.id_profesor = per.id);

-- 3.Obtén los nombres de los alumnos matriculados en el curso escolar 2018-2019, mostrando también el nombre de las asignaturas en las que están matriculados.

select per.nombre as alumnos_matriculados, ce.anyo_inicio, ce.anyo_fin, a.nombre as nombre_asignatura
from alumno_se_matricula_asignatura am join persona per on (am.id_alumno = per.id) 
join curso_escolar ce on (ce.id = am.id_curso_escolar) join asignatura a on (a.id = am.id_asignatura) where anyo_inicio = 2018 and anyo_fin = 2019;

-- 4. Lista todos los profesores y el nombre de las asignaturas que imparten (incluye profesores sin asignaturas asignadas).

select p.id_profesor, per.nombre as nombre_profesor ,a.nombre from profesor p  left join asignatura a on (p.id_profesor = a.id_profesor) join persona per on (per.id = p.id_profesor);

-- 5. Muestra todas las asignaturas con el nombre del profesor que las imparte. Incluye las asignaturas sin profesor asignado.

select a.nombre as nombre_asignatura, per.nombre as nombre_profesor 
from persona per join profesor pro on (per.id = pro.id_profesor) 
right join asignatura a on (a.id = pro.id_profesor);