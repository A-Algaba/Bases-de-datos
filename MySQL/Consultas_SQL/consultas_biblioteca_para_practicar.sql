DROP DATABASE IF EXISTS biblioteca_consultas;
CREATE DATABASE biblioteca_consultas;
USE biblioteca_consultas;

-- BASE DE DATOS: SISTEMA DE BIBLIOTECA
-- =======================================

-- Tabla: autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    nacionalidad VARCHAR(50),
    fecha_nacimiento DATE
);

INSERT INTO autores VALUES
(1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
(2, 'Isabel', 'Allende', 'Chilena', '1942-08-02'),
(3, 'Jorge', 'Luis Borges', 'Argentina', '1899-08-24'),
(4, 'Mario', 'Vargas Llosa', 'Peruana', '1936-03-28'),
(5, 'Laura', 'Esquivel', 'Mexicana', '1950-09-30'),
(6, 'Julio', 'Cortázar', 'Argentina', '1914-08-26'),
(7, 'Pablo', 'Neruda', 'Chilena', '1904-07-12'),
(8, 'Carlos', 'Ruiz Zafón', 'Española', '1964-09-25'),
(9, 'Miguel', 'de Cervantes', 'Española', '1547-09-29'),
(10, 'Federico', 'García Lorca', 'Española', '1898-06-05');

-- Tabla: libros
CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(200),
    id_autor INT,
    genero VARCHAR(50),
    año_publicacion INT,
    numero_paginas INT,
    editorial VARCHAR(100),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO libros VALUES
(1, 'Cien años de soledad', 1, 'Realismo mágico', 1967, 471, 'Sudamericana'),
(2, 'El amor en los tiempos del cólera', 1, 'Novela romántica', 1985, 368, 'Oveja Negra'),
(3, 'La casa de los espíritus', 2, 'Realismo mágico', 1982, 433, 'Plaza & Janés'),
(4, 'Paula', 2, 'Memorias', 1994, 330, 'Plaza & Janés'),
(5, 'Ficciones', 3, 'Cuento', 1944, 174, 'Sur'),
(6, 'El Aleph', 3, 'Cuento', 1949, 200, 'Losada'),
(7, 'La ciudad y los perros', 4, 'Novela', 1963, 409, 'Seix Barral'),
(8, 'Conversación en La Catedral', 4, 'Novela', 1969, 725, 'Seix Barral'),
(9, 'Como agua para chocolate', 5, 'Novela romántica', 1989, 246, 'Planeta'),
(10, 'Rayuela', 6, 'Novela experimental', 1963, 600, 'Sudamericana'),
(11, 'La sombra del viento', 8, 'Misterio', 2001, 565, 'Planeta'),
(12, 'El juego del ángel', 8, 'Misterio', 2008, 672, 'Planeta'),
(13, 'Don Quijote de la Mancha', 9, 'Novela', 1605, 863, 'Francisco de Robles'),
(14, 'Veinte poemas de amor', 7, 'Poesía', 1924, 132, 'Nascimento'),
(15, 'Romancero gitano', 10, 'Poesía', 1928, 120, 'Revista de Occidente');

-- Tabla: socios
CREATE TABLE socios (
    id_socio INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(150),
    telefono VARCHAR(20),
    fecha_registro DATE,
    ciudad VARCHAR(100)
);

INSERT INTO socios VALUES
(1, 'Ana', 'Martínez', 'ana.martinez@email.com', '600123456', '2020-01-15', 'Madrid'),
(2, 'Carlos', 'López', 'carlos.lopez@email.com', '600234567', '2019-05-20', 'Barcelona'),
(3, 'María', 'González', 'maria.gonzalez@email.com', '600345678', '2021-03-10', 'Valencia'),
(4, 'Juan', 'Rodríguez', 'juan.rodriguez@email.com', '600456789', '2018-11-05', 'Sevilla'),
(5, 'Laura', 'Fernández', 'laura.fernandez@email.com', '600567890', '2022-07-22', 'Madrid'),
(6, 'Pedro', 'Sánchez', 'pedro.sanchez@email.com', '600678901', '2020-09-14', 'Bilbao'),
(7, 'Sofía', 'Ramírez', 'sofia.ramirez@email.com', '600789012', '2021-12-01', 'Barcelona'),
(8, 'Diego', 'Torres', 'diego.torres@email.com', '600890123', '2019-02-28', 'Madrid'),
(9, 'Elena', 'Moreno', 'elena.moreno@email.com', '600901234', '2023-04-17', 'Zaragoza'),
(10, 'Miguel', 'Jiménez', 'miguel.jimenez@email.com', '600012345', '2020-06-30', 'Málaga');

-- Tabla: prestamos
CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY,
    id_socio INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion_prevista DATE,
    fecha_devolucion_real DATE,
    estado VARCHAR(20),
    FOREIGN KEY (id_socio) REFERENCES socios(id_socio),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

INSERT INTO prestamos VALUES
(1, 1, 1, '2024-01-10', '2024-01-24', '2024-01-22', 'Devuelto'),
(2, 2, 3, '2024-01-15', '2024-01-29', '2024-02-02', 'Devuelto'),
(3, 3, 5, '2024-02-01', '2024-02-15', NULL, 'En préstamo'),
(4, 1, 7, '2024-02-05', '2024-02-19', '2024-02-18', 'Devuelto'),
(5, 4, 2, '2024-02-10', '2024-02-24', NULL, 'En préstamo'),
(6, 5, 11, '2024-02-15', '2024-03-01', '2024-02-28', 'Devuelto'),
(7, 2, 10, '2024-03-01', '2024-03-15', NULL, 'En préstamo'),
(8, 6, 4, '2024-03-05', '2024-03-19', '2024-03-25', 'Devuelto'),
(9, 7, 8, '2024-03-10', '2024-03-24', '2024-03-23', 'Devuelto'),
(10, 3, 12, '2024-03-15', '2024-03-29', NULL, 'En préstamo'),
(11, 8, 1, '2024-04-01', '2024-04-15', '2024-04-14', 'Devuelto'),
(12, 9, 9, '2024-04-05', '2024-04-19', NULL, 'En préstamo'),
(13, 10, 13, '2024-04-10', '2024-04-24', '2024-05-01', 'Devuelto'),
(14, 1, 6, '2024-05-01', '2024-05-15', NULL, 'En préstamo'),
(15, 5, 14, '2024-05-10', '2024-05-24', '2024-05-22', 'Devuelto'),
(16, 4, 15, '2024-06-01', '2024-06-15', NULL, 'En préstamo'),
(17, 7, 11, '2024-06-10', '2024-06-24', '2024-06-30', 'Devuelto'),
(18, 2, 1, '2024-07-01', '2024-07-15', '2024-07-20', 'Devuelto'),
(19, 6, 3, '2024-08-01', '2024-08-15', NULL, 'En préstamo'),
(20, 8, 7, '2024-09-01', '2024-09-15', '2024-09-14', 'Devuelto');