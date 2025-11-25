-- Nombre: Alberto Algaba Calderón
-- DNI: 77383095D

drop database if exists streaming;
create database streaming;
use streaming;

-- creamos la tabla USUARIO

create table USUARIO (
	id int primary key auto_increment not null,
    email varchar (255) not null,
    clave varchar (255) not null,
    apellido1 varchar (255) not null,
    nombre varchar (255) not null,
    apellido2 varchar (255),
    id_usuario_referido int,
    foreign key (id_usuario_referido) references USUARIO (id) on update cascade on delete set null
);

-- creamos la tabla SERIE

create table SERIE(
	id int primary key auto_increment not null,
    nombre varchar (255) not null
);

-- creamos la tabla VIDEO

create table VIDEO (
	id int primary key auto_increment not null,
    titulo varchar (255) not null,
    sinopsis varchar (255),
    imagen varchar (255),
    video varchar (255),
    duracion int check (duracion >= 0),
    tipo enum ('episodio','pelicula')
);

-- creamos la tabla EPISODIO

create table EPISODIO (
	id_video int primary key not null,
    temporada varchar (255) not null,
    numero int not null,
    foreign key (id_video) references VIDEO (id)
);

-- creamos la tabla pelicula

create table PELICULA (
	id_video int primary key not null,
    puntuacion_IMDB decimal (5,2) default (0.0),
    director varchar (255),
    foreign key (id_video) references VIDEO (id) on delete cascade
);

-- creamos tabla GENERO

create table GENERO (
	id int primary key auto_increment not null,
    genero varchar (255) not null
);

-- creamos tabla de USUARIO_VE_VIDEO

create table USUARIO_VE_VIDEO (
	id_usuario int not null,
    id_video int not null,
    fecha_hora int not null,
    primary key (id_usuario, id_video, fecha_hora),
    foreign key (id_usuario) references USUARIO (id) on delete cascade,
    foreign key (id_video) references VIDEO (id)
);

-- creamos la tabla VIDEO_PERTENECE_GENERO

create table VIDEO_PERTENECE_GENERO (
	id_video int not null,
    id_genero int not null,
    primary key (id_video, id_genero),
    foreign key (id_video) references VIDEO (id) on update cascade,
	foreign key (id_genero) references GENERO (id) on update cascade
);

-- realizamos las siguientes modificaciones

-- alteramos la tabla VIDEO para agregar la columna calidad video, con las siguientes caracteristicas de SD, HD, O FULL HD

alter table VIDEO add calidad_video enum ('SD', 'HD', 'FullHD');

-- alteramos la tabla USUARIO para que la columna apellido2, pase a ser un campo obligatorio

alter table USUARIO modify apellido2 varchar (255) not null;

-- alteramos la tabla USUARIO para modificar la columna clave a que sea de 8 caracteres que siga siendo obligatorio el campo

alter table USUARIO modify clave varchar(8) not null;

-- alteramos la tabla VIDEO para eliminar la columna sinopsis

alter table VIDEO drop sinopsis;