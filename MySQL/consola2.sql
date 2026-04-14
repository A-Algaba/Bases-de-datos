use banco_102;

select * from cuentas;

select * from movimientos;

update cuentas set saldo = saldo - 50 where id_cuenta = 1;

-- realizar transaccion con bloqueo compartido

start transaction;

select * from cuentas where id_cuenta = 2 lock in share mode;

update cuentas set saldo = saldo - 200 where id_cuenta = 2;

-- intentar un select y un update en las tablas ver que operaciones se bloquean, apartado e

select * from cuentas;

update cuentas set saldo = saldo - 500 where id_cuenta = 3;