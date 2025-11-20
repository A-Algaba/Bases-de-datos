drop database if exists ong;
create database ong;
use ong;

create table asociacion(
	CIF varchar (9) primary key,
    denominacion varchar (20) not null,
    direccion varchar (50),
    provincia varchar (15),
    tipo enum('Ecologista', 'Integracion', 'Desarrollo'),
    utilidad_publica enum ('si', 'no') default 'si'
);

create table socio (
	DNI char (9) primary key,
    nombre char (30),
    direccion char (50),
    provincia char (30),
    fecha_alta date not null,
    cuota_mensual decimal (7,5) not null,
    constraint decimal_cuota_mensual check (cuota_mensual >=0),
	aportacion_mensual decimal (7,5) not null,
	constraint decimal_aportacion_mensual check (aportacion_mensual >=0),
    CIF varchar (20),
    foreign key (CIF) references asociacion (CIF) on delete set null on update cascade
);

create table trabajador(
	DNI char (9) primary key,
    nombre varchar (30) not null,
    f_ingreso date,
    tipo enum ('Asalariado','Voluntario'),
    irpf int check (irpf between 0 and 100),
    pagos decimal (9,2) check (pagos >= 0),
    constraint decimal_pagos check ( pagos >= 0),
    profesion varchar (30),
    horas int check (horas >= 0 and horas >= 300),
    edad int check (edad between 18 and 100)
);

create table proyecto (
	id int primary key auto_increment,
    pais varchar (20),
    zona varchar (30),
    objetivo varchar (100)
);

create table trabaja ( -- relacion de muchos a muchos (N:N)
	DNI_trabajador char (9),
    id_proyecto int,
    primary key(DNI_trabajador, id_proyecto),
    foreign key (DNI_trabajador) references trabajador(DNI),
    foreign key (id_proyecto) references proyecto(id)
);

-- ponemos los siguientes comandos para actualizar las tablas de la base de datos

alter table proyecto add nro_beneficiarios int check (nro_beneficiarios >= 0) not null;

alter table socio modify direccion char (60);

alter table trabajador modify f_ingreso date not null;

alter table proyecto add CIF_asociacion varchar (9) not null;

alter table proyecto add foreign key (CIF_asociacion) references asociacion (CIF) on delete restrict on update cascade;