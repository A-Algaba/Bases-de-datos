/*
PROVEEDOR(codigo, direccion, ciudad, provincia)
PK (codigo)

PIEZA(codigo, nombre, color, precio, codigo_categoria)
PK(codigo)
codigo_categoria: FK a CATEGORIA(codigo)

PROVEEDOR_SUMINISTRA_PIEZA(fecha,codigo_proovedor, codigo_pieza,cantidad)
PK (codigo_proveedor, codigo_pieza, fecha)
codigo_proveedor: FK PIEZA(codigo)
codigo_pieza: FK PROVEEDOR(codigo)

CATEGORIA(codigo, nombre)
PK (codigo)
*/

DROP DATABASE IF exists proveedores;
create database proveedores;
use proveedores;

CREATE TABLE PROVEEDOR (
	codigo int primary key auto_increment,
	direccion varchar(150),
	ciudad varchar(20),
    provincia varchar(150)
);

CREATE TABLE CATEGORIA (
	codigo int primary key auto_increment,
    nombre VARCHAR(50) not null
);

create table PIEZA (
	codigo int primary key auto_increment,
    nombre varchar(100) not null,
    color varchar(50),
    precio decimal(3,2), -- en este caso seria de precio 999,50 lo que estoy haciendo es poner tres digitos y despues de la coma solo dos digitios
    categoria int,
    FOREIGN KEY (categoria) REFERENCES CATEGORIA(codigo) -- esto si debe ir en mayusculas
);

create table proovedor_suministra_pieza (
	c_proveedor int,
    c_pieza int,
    cantidad int not null,
    fecha date not null,
    primary key(c_proveedor, c_pieza, fecha),
    foreign key (c_proveedor) REFERENCES PROVEEDOR(codigo),
    foreign key (c_pieza) REFERENCES PIEZA(codigo)
    -- IMPORTANTE: en las claves foraneas (foreign key) debe coindicir la clave primaria de la entidas y en su referencia, es el nombre de la entidad y su nombre de
    -- la clave primaria en original
);