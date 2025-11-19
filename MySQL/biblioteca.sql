DROP DATABASE IF exists biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

create table autor (
	codigo_autor int primary key, -- los valores de int o varchar tienen que coincidir con la clave foranea para hacer relacion entre tablas
    nombre varchar (50) not null
);

create table libro (
	ISBN varchar (10) primary key,
    titulo varchar (100) not null,
    anio date not null,
    cod_autor int,
    foreign key(cod_autor) references autor(codigo_autor)
);

create table socio (
	codigo_socio int primary key,
    nombre varchar (15),
    apellidos varchar (20),
    telefono int
);

create table prestamo (
	codigo int primary key auto_increment,
    fecha_prestamo date not null,
    fecha_devolucion date,
    libro_prestamo varchar (10),
    foreign key (libro_prestamo) references libro(ISBN)
);

-- añadimos nuevas columnas con los siguientes comandos

alter table socio add direccion varchar(50);

alter table libro modify titulo varchar(150);

alter table socio modify telefono varchar(9) not null;

alter table prestamo add cod_socio int;

alter table prestamo add constraint fk_socio foreign key (cod_socio) references socio (codigo_socio) on update cascade;

alter table autor add f_nac date;