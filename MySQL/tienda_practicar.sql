DROP DATABASE IF EXISTS tienda_online;
CREATE DATABASE tienda_online;
USE tienda_online;

-- BASE DE DATOS: TIENDA ONLINE
-- ==============================

-- Tabla: productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(150),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    descuento DECIMAL(5,2),
    valoracion DECIMAL(3,2),
    fecha_lanzamiento DATE
);

INSERT INTO productos VALUES
(1, 'Laptop HP Pavilion', 'Electrónica', 899.99, 45, 10.00, 4.5, '2023-01-15'),
(2, 'Mouse Logitech MX', 'Electrónica', 79.99, 120, 0.00, 4.7, '2022-06-10'),
(3, 'Teclado Mecánico RGB', 'Electrónica', 129.50, 67, 15.00, 4.3, '2023-03-20'),
(4, 'Monitor Samsung 27"', 'Electrónica', 349.99, 30, 20.00, 4.8, '2023-02-05'),
(5, 'Auriculares Sony WH', 'Electrónica', 299.00, 89, 5.00, 4.6, '2022-11-18'),
(6, 'Camisa Polo Lacoste', 'Ropa', 85.00, 200, 0.00, 4.2, '2024-01-10'),
(7, 'Pantalón Vaquero Levi', 'Ropa', 95.50, 150, 10.00, 4.4, '2023-09-25'),
(8, 'Zapatillas Nike Air', 'Calzado', 139.99, 75, 25.00, 4.9, '2023-08-14'),
(9, 'Botas Timberland', 'Calzado', 189.00, 42, 0.00, 4.5, '2023-10-30'),
(10, 'Mochila North Face', 'Accesorios', 110.00, 95, 15.00, 4.3, '2024-02-20'),
(11, 'Reloj Casio Digital', 'Accesorios', 59.99, 180, 0.00, 4.1, '2022-12-05'),
(12, 'Gafas de Sol Ray-Ban', 'Accesorios', 159.00, 64, 20.00, 4.7, '2023-05-12'),
(13, 'Smartphone Samsung A54', 'Electrónica', 449.00, 55, 12.00, 4.4, '2023-04-08'),
(14, 'Tablet iPad Air', 'Electrónica', 649.99, 38, 8.00, 4.8, '2023-07-22'),
(15, 'Impresora HP LaserJet', 'Electrónica', 279.50, 25, 0.00, 4.2, '2022-08-16'),
(16, 'Webcam Logitech C920', 'Electrónica', 89.99, 110, 10.00, 4.5, '2022-10-03'),
(17, 'Chaqueta Columbia', 'Ropa', 145.00, 88, 18.00, 4.6, '2023-11-11'),
(18, 'Sudadera Adidas', 'Ropa', 65.00, 145, 0.00, 4.3, '2024-01-28'),
(19, 'Cinturón Tommy Hilfiger', 'Accesorios', 49.99, 220, 5.00, 4.0, '2023-06-19'),
(20, 'Calcetines Nike Pack 3', 'Ropa', 19.99, 350, 0.00, 4.2, '2023-12-01');

-- Tabla: ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha_venta DATE,
    metodo_pago VARCHAR(30),
    ciudad_envio VARCHAR(50)
);

INSERT INTO ventas VALUES
(1, 1, 2, '2024-03-15', 'Tarjeta', 'Madrid'),
(2, 2, 5, '2024-03-16', 'PayPal', 'Barcelona'),
(3, 3, 1, '2024-03-18', 'Tarjeta', 'Valencia'),
(4, 4, 3, '2024-03-20', 'Transferencia', 'Sevilla'),
(5, 5, 2, '2024-03-22', 'Tarjeta', 'Madrid'),
(6, 6, 4, '2024-03-25', 'PayPal', 'Bilbao'),
(7, 7, 3, '2024-03-28', 'Tarjeta', 'Barcelona'),
(8, 8, 1, '2024-04-02', 'Tarjeta', 'Madrid'),
(9, 9, 2, '2024-04-05', 'Transferencia', 'Zaragoza'),
(10, 10, 5, '2024-04-08', 'PayPal', 'Málaga'),
(11, 1, 1, '2024-04-10', 'Tarjeta', 'Valencia'),
(12, 11, 8, '2024-04-12', 'Tarjeta', 'Madrid'),
(13, 12, 2, '2024-04-15', 'PayPal', 'Sevilla'),
(14, 13, 3, '2024-04-18', 'Tarjeta', 'Barcelona'),
(15, 14, 1, '2024-04-20', 'Transferencia', 'Madrid'),
(16, 15, 2, '2024-04-22', 'Tarjeta', 'Bilbao'),
(17, 16, 4, '2024-04-25', 'PayPal', 'Valencia'),
(18, 17, 2, '2024-04-28', 'Tarjeta', 'Madrid'),
(19, 18, 6, '2024-05-02', 'Tarjeta', 'Barcelona'),
(20, 19, 10, '2024-05-05', 'PayPal', 'Málaga'),
(21, 20, 15, '2024-05-08', 'Tarjeta', 'Madrid'),
(22, 2, 3, '2024-05-10', 'Tarjeta', 'Sevilla'),
(23, 5, 1, '2024-05-12', 'PayPal', 'Zaragoza'),
(24, 8, 2, '2024-05-15', 'Tarjeta', 'Valencia'),
(25, 1, 1, '2024-05-18', 'Transferencia', 'Madrid'),
(26, 3, 2, '2024-05-20', 'Tarjeta', 'Barcelona'),
(27, 6, 5, '2024-05-22', 'PayPal', 'Bilbao'),
(28, 10, 3, '2024-05-25', 'Tarjeta', 'Madrid'),
(29, 13, 1, '2024-05-28', 'Tarjeta', 'Málaga'),
(30, 7, 4, '2024-06-01', 'PayPal', 'Sevilla');

-- Tabla: clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT,
    ciudad VARCHAR(50),
    fecha_registro DATE,
    total_gastado DECIMAL(10,2)
);

INSERT INTO clientes VALUES
(1, 'Roberto', 'García', 28, 'Madrid', '2023-01-15', 2450.75),
(2, 'Carmen', 'López', 35, 'Barcelona', '2023-02-20', 1890.50),
(3, 'Fernando', 'Martínez', 42, 'Valencia', '2022-11-10', 3220.00),
(4, 'Patricia', 'Sánchez', 31, 'Sevilla', '2023-03-05', 1560.25),
(5, 'Alberto', 'Rodríguez', 26, 'Bilbao', '2023-04-18', 980.80),
(6, 'Silvia', 'Fernández', 39, 'Málaga', '2022-09-22', 2780.90),
(7, 'Javier', 'González', 45, 'Zaragoza', '2023-05-30', 4125.60),
(8, 'Beatriz', 'Díaz', 29, 'Madrid', '2023-06-12', 1345.40),
(9, 'Raúl', 'Pérez', 33, 'Barcelona', '2022-12-08', 2890.15),
(10, 'Mónica', 'Moreno', 37, 'Valencia', '2023-07-25', 1670.30),
(11, 'Andrés', 'Jiménez', 41, 'Sevilla', '2023-08-14', 3450.70),
(12, 'Isabel', 'Ruiz', 27, 'Bilbao', '2023-09-03', 890.50),
(13, 'Daniel', 'Hernández', 36, 'Málaga', '2022-10-19', 2230.85),
(14, 'Cristina', 'Torres', 30, 'Madrid', '2023-10-28', 1789.20),
(15, 'Luis', 'Ramírez', 44, 'Barcelona', '2023-11-15', 3890.45);