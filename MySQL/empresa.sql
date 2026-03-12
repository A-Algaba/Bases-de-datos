drop database empresa;
create database empresa;

use empresa;

-- creamos la tabla departamentos

create table departamento(
	id_departamento int,
    nombre varchar(40),
    ciudad varchar (40)
);

-- creamos la tabla empleados

create table empleados(
	id_empleado int,
    nombre varchar(50),
    salario decimal(8,2),
    id_departamento int
);

-- definimos las claves primarias y foraneas

alter table departamento add constraint pk_departamento primary key(id_departamento);

alter table empleados add constraint pk_empleados primary key (id_empleado);

alter table empleados add constraint fk_empleados foreign key (id_departamento) references departamento (id_departamento);

-- mostramos las tablas disponibles y la estructura de la tabla empleados

show tables;

describe empleados;

-- insertamos datos de la tabla departamentos

insert into departamento (id_departamento, nombre, ciudad) values 
(1, "Ventas", "Madrid"),
(2, "Informática", "Sevilla"),
(3, "Recursos Humanos","Valencia"),
(4, "Adminsitración", "Bilbao");

-- insertamos satos en la tabla empleados

insert into empleados(nombre, salario, id_departamento) values 
("Ana Gómez", 1850.00, 1),
("Luis Pérez", 2100.00, 2),
("Marta Ruiz", 1700.00, 4),
("Carlos Sanz", 2200.00, 2),
("Elena Martín", 1950.00, 3),
("Pablo Díaz", 1800.00, 1),
("Laura Gil", 1750.00, 4);

select * from departamento;

select * from empleados;