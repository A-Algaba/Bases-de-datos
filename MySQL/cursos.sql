drop database if exists cursos;
create database cursos;
use cursos;

-- creamos las tablas

create table curso(
    id int primary key,
    descripcion varchar(50),
    coste int not null,
    duracion datetime
);

create table es_prerriquisito(
	idcurso int,
    idcurso_pre int,
    primary key (idcurso, idcurso_pre),
    foreign key (idcurso) references curso(id),
    foreign key (idcurso_pre) references curso(id)
);

create table empleado (
	id int primary key,
    nombre varchar (20),
    apellido1 varchar (20),
    apellido2 varchar (20),
    telefono varchar (11),
    direccion varchar (50)
);

create table edicion (
	id int primary key auto_increment,
    fecha_inicio date not null,
    fecha_fin date not null,
    horario datetime,
    lugar varchar (50) not null,
    idcurso int,
    id_empleado int,
    foreign key (idcurso) references curso (id),
	foreign key (id_empleado) references empleado (id)
);

create table capacitado(
	id_empleado int,
    horario datetime,
    primary key (id_empleado),
    foreign key (id_empleado) references empleado(id)
);

create table no_capacitado(
	id_empleado int,
    primary key(id_empleado),
    foreign key (id_empleado) references empleado (id)
);

create table empleado_recibe_edicion (
	id_edicion int,
    id_empleado int,
    tipo varchar (30),
    primary key(id_edicion, id_empleado),
    foreign key(id_edicion) references edicion (id),
	foreign key(id_empleado) references empleado (id)
);