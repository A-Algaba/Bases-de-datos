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

-- 9. Datos de los profesores que imparten alguna asignatura

select * from persona where id in (select id_profesor from asignatura);

select per.nombre, per.apellido1, per.apellido2 from asignatura a natural join profesor pro 
join persona per group by per.nombre, per.apellido1, per.apellido2;

-- 10. Cantidad de créditos que imparte cada profesor según su nif.

-- 11. Mostrar datos de las asignaturas que tienen más créditos que todas las demás.

select * from asignatura where creditos = (select max(creditos) from asignatura);

-- 12. Mostrar datos de las asignaturas con menos créditos

select * from asignatura where creditos= (select min(creditos) from asignatura);

-- 14. Asignaturas que pertenecen al mismo grado que “Bases de Datos”

select * from grado where id in (select id_grado from asignatura where nombre = "Bases de datos" );

select * from asignatura where id_grado = (select id_grado from asignatura where nombre = "Bases de datos");

select * from grado g join asignatura a on (g.id = a.id_grado) where a.nombre = "bases de datos";

-- 15. Muestra por cada grado la suma de sus créditos.

select sum(a.creditos) as suma_creditos, g.nombre from asignatura a join grado g on (a.id_grado = g.id) group by g.nombre;

-- 16. Cantidad de créditos que imparte cada profesor según su nif.

select sum(a.creditos) as maximos_creditos, nif from asignatura a natural join profesor pro join persona per on (pro.id_profesor = per.id) group by per.nif;

-- Obtener el número de asignaturas que imparte cada profesor, mostrando su nombre y apellidos.

select per.nombre, per.apellido1, per.apellido2, count(a.id) as "asignaturas" from persona per join profesor pro on (pro.id_profesor = per.id) 
join asignatura a on (a.id_profesor = pro.id_profesor) group by pro.id_profesor;

-- Mostrar los datos de todos los grados, tengan o no asignaturas asociadas.

select g.nombre, a.nombre from grado g left join asignatura a on (g.id = a.id_grado);

-- Mostrar los datos de todas las asignaturas, tengan o no profesor asignado.

select * from asignatura a left join profesor p on (a.id_profesor = p.id_profesor);

-- consulta 15: Nombre de las asignaturas que no son las que menos créditos tienen

select * from asignatura where creditos != (select min(creditos) from asignatura);

-- consulta 16: Nombre de las asignaturas que no son las que más créditos tienen

select * from asignatura where creditos != (select max(creditos) from asignatura);

-- REPETIMOS LOS EJERCICIOS DE SUBCONSULTAS

-- Obtener la alumna con mayor edad.

select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona where sexo = "m");

-- Mostrar los datos de la asignatura cuyo id sea el mayor.

select * from asignatura where id = (select max(id) from asignatura);

-- Mostrar el nombre de la asignatura y el nombre de su grado asociado.

select a.nombre as nombre_asignatura, g.nombre as nombre_grado from asignatura a join grado g on (a.id_grado = g.id);

-- Mostrar el nombre de todas las asignaturas, el nombre de su grado, y el nombre y apellidos del profesor que las imparte.


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

select p.id_profesor, per.nombre as nombre_profesor ,a.nombre from profesor p  left join asignatura a on (p.id_profesor = a.id_profesor) 
join persona per on (per.id = p.id_profesor);

-- 5. Muestra todas las asignaturas con el nombre del profesor que las imparte. Incluye las asignaturas sin profesor asignado.

select a.nombre as nombre_asignatura, per.nombre as nombre_profesor 
from persona per join profesor pro on (per.id = pro.id_profesor) 
right join asignatura a on (a.id = pro.id_profesor);

--  1. Obtener el nombre y apellidos de todos los alumnos, junto con el nombre del grado que cursan.

select per.nombre, per.apellido1, per.apellido2, g.nombre 
from persona per join alumno_se_matricula_asignatura am on (per.id = am.id_alumno) 
join asignatura a on (a.id = am.id_asignatura) 
join grado g on (g.id = a.id_grado);

-- 2. Mostrar el nombre de cada asignatura y el nombre del grado al que pertenece.

select a.nombre as nombre_asignatura, g.nombre as nombre_grado from asignatura a join grado g on (a.id_grado = g.id);

-- 3. Listar todas las asignaturas junto con el nombre y apellidos del profesor que las imparte.

select a.nombre as nombre_asignatura, per.nombre as nombre_profesor, per.apellido1, per.apellido2 
from asignatura a join profesor pro on (pro.id_profesor = a.id_profesor) 
join persona per on (pro.id_profesor = per.id);

-- 4. Obtener el nombre de los profesores y el nombre del departamento al que pertenecen.

select per.nombre as nombre_profesor, d.nombre as nombre_departamennto 
from persona per join profesor pro on (per.id = pro.id_profesor)
join departamento d on (pro.id_departamento = d.id);

-- 5.Obtener el nombre de las asignaturas en las que esté matriculado el alumno llamado “Sonia”.

select * from persona per right join alumno_se_matricula_asignatura am on (am.id_alumno = per.id) 
right join asignatura a on (a.id = am.id_asignatura) where per.nombre = "sonia";

-- 6. Listar los departamentos que no tienen profesores asociados.

select d.nombre from departamento d where d.id not in (select distinct p.id_departamento from profesor p where p.id_departamento is not null);

-- 7.Mostrar el nombre de las asignaturas que pertenecen al Grado en Ingeniería Informática.alter

select * from asignatura where id_grado = (select id from grado where id = 4);

-- 8. Obtener los nombres de los profesores que pertenecen al departamento de Informática.

select * from profesor where id_departamento in (select id from departamento where nombre = "informatica");

select per.nombre as "nombre profesor", d.nombre as "nombre departamento" from departamento d 
join profesor pro on (d.id = pro.id_departamento) 
join persona per on (per.id = pro.id_profesor) where d.nombre = "informatica";

-- 9. Mostrar los alumnos matriculados en el curso escolar 2018–2019.

select * from alumno_se_matricula_asignatura where id_curso_escolar = (select id from curso_escolar where anyo_inicio = 2018 and anyo_fin = 2019);

select * from alumno_se_matricula_asignatura am join curso_escolar cur on (am.id_curso_escolar = cur.id) where anyo_inicio = 2018 and anyo_fin = 2019;

-- 10. Obtener las asignaturas que tengan el mismo número de créditos que la asignatura “Bases de Datos”.

select * from asignatura where creditos = (select creditos from asignatura where nombre = "bases de datos");

-- 11. Mostrar los grados que tengan al menos una asignatura sin profesor asignado.

select * from grado where id in (select id_grado from asignatura where id_profesor is null);

select * from grado g join asignatura a on (g.id = a.id_grado) where a.id_profesor is null;

-- 12. Mostrar las asignaturas impartidas por profesores del departamento de Matemáticas.

select * from asignatura where id_profesor in (select id_profesor from profesor where id_departamento in (select id from departamento where nombre = "matematicas"));

-- 13. Obtener el nombre y apellidos de los alumnos que estén matriculados en la asignatura llamada “Cálculo”.

select * from persona where id in (select id_alumno from alumno_se_matricula_asignatura where id_asignatura in (select id from asignatura where nombre = "calculo"));