drop database GESTION_CENTRO;

create database GESTION_CENTRO;

use GESTION_CENTRO;

create table PROFESORES (
	id_profesor int primary key,
    nombre varchar (50),
    sueldo decimal (10,2),
    email varchar (100)
);

create table ASIGNATURAS (
	id_asignatura int primary key auto_increment,
    nombre_asig varchar (60),
    horas_semanales int,
    id_profesor int, -- clave foranea
    cupo_alumnos int
);

alter table ASIGNATURAS add constraint fk_asignaturas_profesores foreign key (id_profesor) references PROFESORES (id_profesor);

-- insercion de datos

insert into PROFESORES (id_profesor, nombre, sueldo, email) values 
(1, "Carlos Fernández", 1000.00, "carlos@centro.es"),
(2, "Daniel Montañés", 1000.00, "daniel@centro.es"),
(3, "Celia Macías", 1000.00, "celia@centro.es");

insert into ASIGNATURAS (nombre_asig, horas_semanales, id_profesor, cupo_alumnos) values 
("Bases de Datos", 6, 1, 30),
("Lenguaje de Marcas", 3, 1, 26),
("Sistemas", 5, 1, 24),
("Programación", 8, 2, 30),
("Entornos de Desarrollo", 3, 3, 22);

-- modificaciones de datos y borrado

set sql_safe_updates = 0; -- para evitar errores de bloqueo

-- descuenta un 15% el sueldo a todos los profesores

update PROFESORES set sueldo = sueldo / 15;

-- aumenta en 5 unidades el cupo de alumnos de todas las asignaturas que imparte Carlos Fernandez

update ASIGNATURAS set cupo_alumnos = cupo_alumnos + 5 where id_profesor in (select id_profesor from PROFESORES where nombre = "Carlos Fernández");

-- Cambia el nombre de la asignatura Sistemas a Sistemas Informaticos

update ASIGNATURAS set nombre_asig = "Sistemas Informáticos" where id_asignatura = 3;

-- cambia de profesor de Bases de Datos para que imparta Celia Macias

update ASIGNATURAS set id_profesor = 3 where nombre_asig = "Bases de Datos";

-- borra la asignatura entornos de desarrollo

delete from ASIGNATURAS where nombre_asig = "Entornos de Desarrollo";

-- Pruebas de Integridad

-- intenta insertar una nueva asignatura con id_porfesor 4

insert into ASIGNATURAS (nombre_asig, horas_semanales, id_profesor, cupo_alumnos) values 
("Itinerario para la Empleabilidad", 3, 4, 17);

-- Intenta borrar al profesor Daniel Montañéz

delete from PROFESORES where nombre = "Daniel Montañés"; 

-- intenta cambiar el id_profesor de Carlos Fernandez (id 1), por el id 10

update PROFESORES set id_profesor = 10 where nombre = "Carlos Fernández";

-- soluccion del problema de integridad

alter table ASIGNATURAS drop foreign key fk_asignaturas_profesores;

alter table ASIGNATURAS add constraint fk_asignaturas_profesores foreign key (id_profesor) references PROFESORES (id_profesor) on update cascade on delete set null;

-- comprobacion final

-- volvemos a intentar borrar al profesor Daniel Montañes

delete from PROFESORES where nombre = "Daniel Montañés"; 

-- volvemos a intentar cambiar el id_profesor del profesor Carlos

update PROFESORES set id_profesor = 10 where nombre = "Carlos Fernández"; 

-- consultas basicas para comprobar los resultados

select * from ASIGNATURAS;

select * from PROFESORES;

-- contenido final de ambas tablas

select * from PROFESORES p join ASIGNATURAS A on (p.id_profesor = a.id_profesor);