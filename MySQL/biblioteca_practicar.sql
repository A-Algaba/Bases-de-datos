DROP DATABASE biblioteca_practicar;

CREATE DATABASE biblioteca_practicar;

USE biblioteca_practicar;

-- creamos las tablas

CREATE TABLE socios (
    id_socio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(80),
    fecha_alta DATE,
    activo TINYINT DEFAULT 1
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

INSERT INTO socios (nombre, apellido, email, fecha_alta) VALUES
("Lucia", "Fuentes", "LuciaFuentes1123@gmail.com", "2024-05-06"),
("Pedro", "Torres", "PedroTorres4455@gmail.com", "2020-11-20"),
("Jose", "Lopez", "JoseLopez213@gmail.com", "2023-02-02"),
("Rosa", "Ortega", "RosaOrtega987@gmail.com", "2025-08-24");

INSERT INTO prestamos (id_socio, id_libro, fecha_prestamo, fecha_devolucion)  VALUES
(1,3, "2025-10-13", NULL),
(3,3,"2025,11-20","2025-12-3"),
(4,2, "2025-7-24", "2025-8-15");

-- insert

INSERT INTO libros (titulo, autor, id_categoria,stock) VALUES 
("Mar rojo", "Miguel Gallardo", NULL,7); -- si se intenta ignorar la categoria del libro da error, se puede soluccionar poniendole una categoria o dejandola en null

INSERT INTO prestamos (id_socio, id_libro, fecha_prestamo, fecha_devolucion) VALUES 
(5, 1, "2024-05-15", "2024-06-20"); -- no se puede ejecutar y da error porque no se puede crear un prestamo a un socio que no existe, es como si en unna empresa intentas meter a un empleado a un departamento que no existe

INSERT INTO socios (nombre, apellido, email, fecha_alta) VALUES 
("Pepe",  "Martinez", "PepeMartinez12345@gmail.com", "2021-05-12"),
("Laura", "Flores", "PepeMartinez12345@gmail.com", "2022-03-02"); -- en este caso no me ha salido ninguna restriccion

-- update

UPDATE libros SET stock = -3 WHERE titulo = "Viaje al futuro"; -- esto se puede hace sin problemas,  para  soluccionarlo alteramos la tabla lirbos con la sentencia UNSIGNED en el stock

DELETE FROM libros WHERE stock = -3; -- primero borrar la columna afectada para que no de error error out of range value for column at row 

ALTER TABLE libros MODIFY COLUMN stock BIGINT UNSIGNED; -- se altera  la tabla para poner la sentencia unsigned

UPDATE libros SET stock = -3 WHERE titulo = "Viaje al futuro"; -- al volver a ejecutarlo da error

UPDATE libro SET id_categoria = 8 WHERE titulo = "Viaje a mas alla de marte"; -- da error porque no se puede cambiar la categoria de un libro a una categoria que no existe, es como el mismo ejemplo de anes de la empresa, no puedes meter a un empleado a un departamento que no existe, no tendria sentido

-- delete

DELETE FROM libros WHERE id_categoria = 1; -- no deberia dejar eliminar porque hay libros asociados a una catgeoria activa, respetando al integridad referencial

-- una soluccion podria ser añadir la opcion on delete set null en la foreing key parta que permita establecer valores nulos en claves  foraneas asociadas si se elimina algo
-- en mi caso si me deja porque ya lo tengo puesto el on delete set null de antes

DELETE FROM prestamos WHERE id_socio = 1; -- si me deja porque tengo el on delete set null en la foreing key pero si no se pone daria error, respetando la integridad referencial

DELETE FROM prestamos WHERE fecha_devolucion = NOT NULL;

-- consultas basicas para comprobar los  cambios realizados

SELECT * FROM categorias;

SELECT * FROM libros;

SELECT * FROM socios;

SELECT * FROM prestamos;