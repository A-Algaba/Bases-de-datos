DROP DATABASE IF exists clientes;
create database clientes;
use clientes;

create table clientes (
	dni int primary key auto_increment,
    nombre varchar (20) not null,
    apellidos varchar (20) not null,
    direccion int not null,
    fecha_nac int not null
);

create table proveedor (
	nif int primary key auto_increment,
    nombre varchar (20),
    direccion int
);

create table producto (
	codigo int primary key auto_increment,
    nombre varchar (50) not null,
    precio_unit decimal (3,2) not null
    
);

create table cliente_compra_producto (
	dni_cliente int,
    c_producto int,
    primary key (dni_cliente, c_producto),
    foreign key(dni_cliente) references proveedor(nif),
    foreign key(c_producto) references producto(codigo)
);