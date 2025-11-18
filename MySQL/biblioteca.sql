DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
use biblioteca;

create table libro (
	ISBN varchar (10) primary key,
    titulo varchar (100) not null,
    anio date not null,
    cod_autor int (5),
    foreign key(cod_autor) references autor(cod_autor)
);

create table socio (
	cod_socio int (5) primary key,
    nombre varchar (15),
    apellidos varchar (20),
    telefono int (9)
);

create table prestamo (
	codigo int (7) primary key auto_increment,
    fecha_prestamo date not null,
    fecha_devolucion date,
    libro int (5),
    foreign key (libro) references libro(ISBN)
);

create table autor (
	cod_autor int (5) primary key,
    nombre varchar (50) not null,
    ISBN varchar (10),
    foreign key (ISBN) references libro(ISBN)
);