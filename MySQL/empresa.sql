DROP DATABASE empresa;

CREATE DATABASE empresa;

USE empresa;

-- creamos la tabla departamentos

CREATE TABLE departamento(
	id_departamento INT PRIMARY KEY,
    nombre VARCHAR(40),
    ciudad VARCHAR(40)
);

-- creamos la tabla empleados

CREATE TABLE empleados(
	id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    salario DECIMAL(8,2),
    id_departamento INT
);

-- definimos la clave foranea id_departamento de la tabla empleados
ALTER TABLE empleados ADD CONSTRAINT fk_empleados FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento);

-- mostramos las tablas disponibles y la estructura de la tabla empleados

SHOW tables;

DESCRIBE empleados;

-- insertamos datos de la tabla departamentos

INSERT INTO departamento (id_departamento, nombre, ciudad) VALUES
(1, "Ventas", "Madrid"),
(2, "Informática", "Sevilla"),
(3, "Recursos Humanos","Valencia"),
(4, "Adminsitración", "Bilbao");

-- insertamos satos en la tabla empleados

INSERT INTO empleados(nombre, salario, id_departamento) VALUES 
("Ana Gómez", 1850.00, 1),
("Luis Pérez", 2100.00, 2),
("Marta Ruiz", 1700.00, 4),
("Carlos Sanz", 2200.00, 2),
("Elena Martín", 1950.00, 3),
("Pablo Díaz", 1800.00, 1),
("Laura Gil", 1750.00, 4);

-- nuevas inserciones

INSERT INTO empleados(nombre, salario, id_departamento) VALUES 
("Sonia Lopez", 2150.00, 2),
("Mario Torres", 1780.00, 1),
("Nuria Vega", 1900.00, NULL); -- el id_departameno 8 no existe

-- actualizamos datos

UPDATE empleados SET salario = 1900.00 WHERE nombre = "Ana Gomez";

UPDATE empleados SET salario = salario +  100 WHERE id_departamento = 2;

UPDATE departamento SET ciudad = "Malaga" WHERE id_departamento = 4;

UPDATE empleados SET id_departamento = 3 WHERE nombre = "Marta Ruiz";

UPDATE empleados SET salario = salario + 50 WHERE  id_departamento = (SELECT id_departamento 
FROM departamento WHERE ciudad = "Madrid");

UPDATE empleados SET salario = salario - 100 WHERE id_departamento = (
    SELECT id_departamento FROM departamento WHERE nombre = "Ventas"
);

-- eliminar datos

DELETE FROM empleados WHERE nombre = "Pablo Díaz";

DELETE FROM empleados WHERE salario <= 1800;

-- modificamos clave foranea
ALTER TABLE empleados DROP FOREIGN KEY fk_empleados;

ALTER TABLE empleados ADD CONSTRAINT fk_empleados FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento) ON DELETE SET NULL;

DELETE FROM departamento WHERE nombre = "Ventas";

DELETE FROM departamento WHERE nombre = "Informatica";

DELETE FROM empleados WHERE id_departamento IN (SELECT id_departamento FROM departamento WHERE nombre = "Recursos Humanos");

DELETE FROM departamento WHERE nombre = "Recursos humanos";

DELETE FROM empleados WHERE id_departamento IN (SELECT id_departamento FROM departamento WHERE ciudad = "Malaga");

DELETE FROM departamento WHERE nombre = "Administracion";

-- comprobaciones finales

INSERT INTO empleados (nombre, salario, id_departamento) VALUES 
("Juan", 1900.00, 7); -- no se puede porque en la tabla referenciada (la tabla departamento), no hay ningun regsitro de id 7

UPDATE empleados SET id_departamento = 8 WHERE nombre = "Ana Gómez"; -- no se puede modificar porque no existe ningun departamento con un id 8 en la tabla  departamento

DELETE departamento WHERE id_departamento = 1; -- no se puede porque hay empleados asociados en el departamento 1 (integridad referencial)

--  consultas de prueba para comprobar los resultados
SELECT * FROM departamento;

SELECT * FROM empleados;

SELECT e.*, d.nombre FROM empleados e JOIN departamento d ON (e.id_departamento = d.id_departamento);

SELECT * FROM empleados e JOIN departamento d ON (e.id_departamento = d.id_departamento) WHERE e.id_departamento IS NULL;