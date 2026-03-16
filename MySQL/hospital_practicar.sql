drop database hospital_practicar;

create database hospital_practicar;

use hospital_practicar;

-- creamos las tablas

create table especialidades (
	id_especialidad int primary key auto_increment,
    nombre varchar(50),
    planta int -- planta del hospital donde esta
);

create table medicos (
	id_medico int primary key auto_increment,
    nombre varchar(50),
    apellidos varchar(50),
    id_especialidad int,
    activo tinyint default 1
);

create table pacientes (
	id_paciente int primary key auto_increment,
    nombre varchar(50),
    apellidos varchar(50),
    fecha_nacimiento  date,
    telefono varchar(10)
);

create table citas (
	id_cita int primary key auto_increment,
    id_paciente int,
    id_medico int,
    fecha_cita date,
    motivo varchar (100),
    atendida tinyint default 0
);

-- alteramos tablas y añadimos claves foraneas

alter table medicos add constraint fk_especialidad foreign key (id_especialidad) references especialidades (id_especialidad) on delete set null;

alter table citas add constraint fk_citas_pacientes foreign key (id_paciente) references pacientes (id_paciente) on delete set null;

alter table citas add constraint fk_citas_medicos foreign key (id_medico) references medicos (id_medico) on delete set null;

-- insertamos datos

insert into especialidades (nombre, planta) values 
("Traumatologia", 3),
("Neurologia", 1),
("Cardiologia",2);

insert into medicos (nombre, apellidos, id_especialidad) values 
("Pepe", "Gonzalez", 1),
("Jose", "Montes", 3),
("Maria", "Fuentes", 2),
("Gonzalo", "Torres", 1);

insert into pacientes (nombre, apellidos, fecha_nacimiento, telefono) values
("Mario", "Torres", "1995-08-05", "532123476"),
("Laura", "Paredes", "2000-11-28","876123547"),
("Tomas", "Cardenas", "1897-01-12","32136589"),
("Marta", "Gonzalez", "2002-02-03", "87655321");

insert citas (id_paciente, id_medico, fecha_cita, motivo, atendida) values 
(1, 3, "2025-12-02", "dolor en el corazon", 1),
(2, 4, "2025-10-26", "rotura en el brazo",0),
(3, 1, "2026-03-01", "rotura en la pierna", 1),
(4,2, "2025-9-27", "posible infarto",0);

-- insert

insert into medicos (nombre, apellidos, id_especialidad, activo) values 
("Carlos", "Ramirez", 6, 1); -- da error porque no se puede asignar un medico a una especialidad que no existe o no esta registrada en la trabla especialidades

insert into citas (id_paciente, id_medico, fecha_cita, motivo, atendida) values
(9, 1, "2025-04-02", "dolor en la cabeza", 1); -- da error porque no se puede meter a un paciente que no existe a una consulta, en la tabla pacientes no se registra ningun paciente con id_paciente 9


insert into medicos (nombre, apellidos, id_especialidad, activo) values 
("Jose", "Fuentes", null, 1); -- esto si deja ejecutarse, pero realmente no tiene mucho sentido, ya que un medico suele tener una especialidad, 
-- para soluccionarlo se podria actualizar la tabla medicos, para que su id_especialidad no permita valores nulos, y antes de eso modificar la clave foranea

alter table medicos drop foreign key fk_especialidad;

alter table medicos add constraint fk_especialidad foreign key (id_especialidad) references especialidades (id_especialidad); -- se vuelve a crear la clave foranea, pero que esta vez no se poermitan los valores nulos

delete from medicos where nombre = "Jose"; -- borramos el medico creado

alter table medicos modify id_especialidad int not null;-- alteramos la columna id_especialidad de la tabla medicos para que no se pueda poner valores nulos

-- intentamos volver a crear el usuario

insert into medicos (nombre, apellidos, id_especialidad, activo) values 
("Jose", "Fuentes", null, 1); -- y ahora no me deja crearlo y se indica que el id_especialidad no puede ser nulo

-- insertar un dato extra de un medico y de una cita yh de un paciente

insert into medicos (nombre, apellidos, id_especialidad, activo) values 
("Luis", "Ramirez", 2, 1);

insert into pacientes (nombre, apellidos, fecha_nacimiento, telefono) values 
("Raul", "Garcia", "1990-02-03", "567213465");

insert into citas (id_paciente, id_medico, fecha_cita, motivo, atendida) values
(5, 6, "2025-05-19", "dolor en la columna vertebral", 0);

-- update

update medicos set id_especialidad = 7 where nombre = "Pepe"; -- no deja porque no se puede meter un medico a una especialidad que no existe y que nop esta registrado en la tabla especialidad

update medicos set activo = 0 where id_medico in (select id_medico from citas where atendida = 0);

update citas set id_medico = 10 where id_cita = 1; -- no deja porque no se puede asignar un inexistente a una cita, ya que no hay ningun medico registrado en la tabla medicos con el id_medico 10

-- delete

delete from especialidades where nombre = "Cardiologia"; -- en este caso si me deja eliminar la especialidad porque esta habilitado la funcion on delte set null en la fk de medicos y especialidades

delete from medicos where id_medico in (select id_medico from citas where atendida = 0); -- este si deja eliminarse, y seguramente  no deberia dejar que se  elimine, por ahora desconozco el metodo de como soluccionarlo de manera segura

-- creamos un paciente de prueba que no estara registrado en ninguna cita

insert into pacientes (nombre, apellidos, fecha_nacimiento, telefono) values 
("Helena", "Montes", "2000-05-12", "56347425");

delete from pacientes where id_paciente not in (select id_paciente from citas);

-- consultas pruebas

select * from especialidades;

select * from medicos;

select * from pacientes;

select * from citas;
