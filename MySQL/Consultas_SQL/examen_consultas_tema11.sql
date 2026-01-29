use universidad;

-- Nombre: Alberto Algaba Calderón
-- Consulta 1

select nif, fecha_nacimiento from persona where fecha_nacimiento < (select fecha_nacimiento from persona where nif = "79503962T");

-- Nombre: Alberto Algaba Calderón
-- Consulta 2

select d.nombre ,count(d.id) as "Nº profesores" from departamento d join profesor p on (d.id = p.id_departamento) group by d.nombre;

-- Nombre: Alberto Algaba Calderón
-- Consulta 3

select nombre from asignatura where curso = (select max(curso) from asignatura); 

-- Nombre: Alberto Algaba Calderón
-- Consulta 4

select cur.*, count(id_curso_escolar) as "nº matriculas" from alumno_se_matricula_asignatura am 
right join curso_escolar cur on (am.id_curso_escolar = cur.id) group by cur.id;

-- Nombre: Alberto Algaba Calderón
-- Consulta 5

select a.nombre as "asignatura", per.nombre, per.apellido1, per.apellido2
from persona per join alumno_se_matricula_asignatura am on (per.id = am.id_alumno) 
join asignatura a on (am.id_asignatura = a.id);

-- Nombre: Alberto Algaba Calderón
-- Consulta 6

select g.nombre, max(a.id) as "nº asignaturas" from grado g join asignatura a on (a.id_grado = g.id) group by g.nombre;

-- Nombre: Alberto Algaba Calderón
-- Consulta 7

select g.nombre, sum(a.creditos) as suma_creditos from grado g left join asignatura a on (a.id_grado = g.id) group by g.nombre;

-- Nombre: Alberto Algaba Calderón
-- Consulta 8

select pro.id_departamento, count(pro.id_profesor) AS mujeres from departamento d join profesor pro on (pro.id_departamento = d.id)
join persona per on (pro.id_profesor = per.id) group by pro.id_departamento;

-- Nombre: Alberto Algaba Calderón
-- Consulta 9

select per.nombre, per.apellido1, per.apellido2, sum(creditos) as suma_creditos
from persona per join alumno_se_matricula_asignatura am on (per.id = am.id_alumno)
join asignatura a on (am.id_asignatura = a.id) group by am.id_alumno;

-- Nombre: Alberto Algaba Calderón
-- Consulta 10

select * from curso_escolar where anyo_inicio = (select max(anyo_inicio) from curso_escolar);