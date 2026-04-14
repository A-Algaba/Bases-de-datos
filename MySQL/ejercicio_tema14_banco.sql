drop database if exists banco_102;

create database banco_102;

use banco_102;

CREATE TABLE cuentas (
id_cuenta INT PRIMARY KEY,
titular VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2) NOT NULL
) ;

CREATE TABLE movimientos (
id_mov INT AUTO_INCREMENT PRIMARY KEY,
id_cuenta INT NOT NULL,
tipo VARCHAR(30) NOT NULL,
importe DECIMAL(10,2) NOT NULL,
fecha_mov TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_cuenta) REFERENCES cuentas(id_cuenta)
) ;

INSERT INTO cuentas (id_cuenta, titular, saldo) VALUES
(1, 'PC102', 1000.00),
(2, 'Daniel', 1000.00),
(3, 'Carlos', 1500.00);

SELECT * FROM cuentas;

-- Apartado A

start transaction;

update cuentas set saldo = saldo - 200 where id_cuenta = 1;

update cuentas set saldo = saldo + 200 where id_cuenta = 2;

select * from cuentas;

insert into movimientos(id_cuenta, tipo, importe) values(1, "transferencia_salida", 200.00);

insert into movimientos(id_cuenta, tipo, importe) values(2, "trasferencia_entrada", 200.00);

select * from movimientos;

commit;

-- Apartado B

start transaction;

update cuentas set saldo = saldo - 300 where id_cuenta = 1;

update cuentas set saldo = saldo + 300 where id_cuenta = 2;

insert into movimientos(id_cuenta, tipo, importe) values(1, "transferencia_salida", 300.00);

insert into movimientos(id_cuenta, tipo, importe) values(2, "trasferencia_entrada", 300.00);

savepoint punto_guardado_apartado_b;

update cuentas set saldo = saldo - 20 where id_cuenta = 1;

insert into movimientos(id_cuenta, tipo, importe) values(1, "transferencia_comision", 20.00);

select * from cuentas;

select * from movimientos;

rollback to savepoint punto_guardado_apartado_b;

commit;

-- Apartado C

start transaction;

select * from cuentas where id_cuenta = 1 for update;

commit;


-- Apartado D

start transaction;

select * from cuentas where id_cuenta = 2 lock in share mode;

commit;

-- Apartado E

start transaction;

lock tables cuentas write;

unlock tables;

-- realizar bloqueo de lectura sobre la tabla

lock tables cuentas read;

unlock tables;

rollback;