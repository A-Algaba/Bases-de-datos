DROP DATABASE IF exists mentores;
create database mentores;
use mentores;

CREATE TABLE ADMINISTRADOR_AULA (
	dni varchar(9) primary key,
    nombre varchar (20) not null,
    email varchar(30) not null
);

CREATE TABLE AULA (
	cod int primary key auto_increment,
    nombre varchar (15) not null,
    dir varchar (30) not null
);

CREATE TABLE ALUMNO (
	email varchar (30) primary key,
    dni varchar (9) not null,
    nombre varchar (15) not null,
    direccion varchar (30) not null,
    tfno varchar (12) not null,
    español boolean  not null,
    cod_aula int,
    foreign key(cod_aula) references AULA(cod)
);

CREATE TABLE CURSO (
	nombre varchar(15) primary key,
    libro varchar (20) not null,
    email varchar (30) not null
);

CREATE TABLE TUTOR (
	dni varchar (9) primary key,
    nombre varchar (15) not null,
    email varchar (30) not null
);

CREATE TABLE ADMINISTRADOR_ADMINISTRA_AULA(
	dni_administrador varchar (9),
    cod_aula int,
    primary key (dni_administrador, cod_aula),
    foreign key (dni_administrador) references ADMINISTRADOR_AULA(dni),
    foreign key (cod_aula) references AULA(cod)
);

CREATE TABLE ALUMNO_MATRICULA_CURSO(
	email_alumno varchar (30),
    nombre_curso varchar (15),
    f_ini int not null,
    f_fin int not null,
    primary key(email_alumno, nombre_curso),
    foreign key(email_alumno) references ALUMNO(email),
    foreign key(nombre_curso) references CURSO(nombre)
);

CREATE TABLE TUTOR_TUTORIZA_CURSO(
	nombre_curso varchar (15),
    dni_tutor varchar (9),
    primary key(nombre_curso, dni_tutor),
    foreign key(nombre_curso) references CURSO(nombre),
    foreign key(dni_tutor) references TUTOR(dni)
);

CREATE TABLE TUTOR_TUTORIZA_TUTOR(
	dni_tutor varchar (9),
    dni_coordinador varchar (9),
    primary key(dni_tutor, dni_coordinador),
    foreign key(dni_tutor) references TUTOR(dni),
    foreign key(dni_coordinador) references TUTOR(dni)
);