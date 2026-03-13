CREATE DATABASE biblioteca_practicar;

USE biblioteca_practicar;

-- creamos las tablas

CREATE TABLE socios (
    id_socio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(80),
    fecha_alta DATE,
    activo INT DEFAULT 1
);

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(90)
);

CREATE TABLE libros (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    autor VARCHAR(50),
    id_categoria INT, -- fk a categorias
    stock INT
);

CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_socio INT, -- fk a socios
    id_libro INT, -- fk a libros
    fecha_prestamo DATE,
    fecha_devolucion DATE -- puede ser null si aun no se devolvio
);

-- claves foraneas

ALTER TABLE libros ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria) ON DELETE SET NULL;

ALTER TABLE prestamos ADD CONSTRAINT fk_socio FOREIGN KEY (id_socio) REFERENCES socios (id_socio) ON DELETE SET NULL;

ALTER TABLE prestamos ADD CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES libros (id_libro) ON DELETE SET NULL;

-- insertamos los datos

INSERT INTO categorias (id_categoria, nombre, descripcion) VALUES 
(1, "misterio", "libro de misterio"),
(2, "terror y psicologia", "libro de terror psicologico"),
(3, "ciencia ficcion", "libro de ciencia ficcion");

INSERT INTO libros (titulo, autor, id_categoria, stock) VALUES 
("Personas desaparecidas en isla misteriosa", "Antonio Navarro", 1, 10),
("La oscuridad acecha en donde no se espera", "Maria Fuentes", 2, 6),
("Viaje al futuro", "Alvaro Casado", 3, 20),
("Viaje a mas alla de marte", "Alba Rosado", 3, 5),
("El caso del diamante rojo desaparecido", "Fernando Ruiz", 1, 8);

SELECT * FROM categorias;

SELECT * FROM libros;