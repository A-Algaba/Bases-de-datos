-- crear usuario para que se conecte desde el mismo equipo de la BBDD
create user "usuario_prueba"@"localhost" identified by "123456";

-- crear usuario para que se conecte desde cualquier parte

create user "usuario_prueba"@"%" identified by "123456";

-- crear usuario para que se conecte desde una direccion

create user "usuario_prueba"@"192.168.20.105" identified by "123456";

-- permisos o privilegios
-- select, insert, update, create, delete, drop, alter, index

-- comandos de control
-- grant - asigna permiso
-- revoke - elimina permiso

-- vista - es una consulta almacenada que se puede usar como si fuera una tabla
-- simplifica consulta, oculta datos sensibles, y mejora la seguridad

-- indice - es una estructura que permite acceder a datos mas rapido
-- sin indice - recorre toda la tabla
-- con indice - se accede directamente al dato

-- ejercicio 1: creacion de indice

-- 1. crear un indice sobre la columna nombre_aisg de la tabla asignaturas

use GESTION_CENTRO;

create index idx_nombre_asign on ASIGNATURAS(nombre_asig); -- se crea el indice

-- 2. ejecutar la consulta

select * from asignaturas where nombre_asig = "Sistemas Informáticos";

-- 3. ¿que diferencia hay con y sin indice?
-- con el indice se acceden a los datos de manera mas rapida mientras que sin indice tienes que recorrer toda la tabla

-- ejercicio 2 creacion de vista
-- 1. crear una vista que muestre el nombre de la asignatura, nombre del profesor

create view vista_asignaturas_profesores as
select a.nombre_asig, p.nombre from profesores p join asignaturas a on (p.id_profesor = a.id_profesor);

-- 2. consulta la vista

select * from vista_asignaturas_profesores;

-- 3. crear una vista que solo muestre los datos menos el sueldo del profesor como seguridad

create view vista_seguridad_sueldo as
select id_profesor, nombre, email from profesores;

select * from vista_seguridad_sueldo;

-- ejercicio 3 creacion de usuarios
-- crear el usuario carlos_user solo desde el mismo equipo
-- crear al usuario daniel_user desde cualquier parte
-- crear al usuario celia_user desde el mismo equipo

create user "carlos_user"@"localhost" identified by "123456"; -- CUIDADO CON LOS ESPACIOS EL NOMBRE DE USUARIO CON EL @ EL TIPO DE CONEXION VAN JUNTOS
create user "daniel_user"@"%" identified by "123456";
create user "celia_user"@"localhost" identified by "123456";

-- ejercicio 4 asignacion de permisos

-- asignar permisos a carlos solo select en toda la base de datos

grant select on GESTION_CENTRO.*to "carlos_user"@"localhost";

-- a daniel select, insert a la tabla asignaturas

grant select, insert on GESTION_CENTRO.asignaturas to "daniel_user"@"%";

-- a celia select, update a la tabla asignaturas

grant select, update on GESTION_CENTRO.asignaturas to "celia_user"@"localhost";

-- ejercicio 6: comrpobacion de permisos
-- probar con carlos, meterse en database, conect to database
-- probar con daniel
-- probar con celia

select user, host from mysql.user;

-- ejercicio 7: seguridad con vistas
-- eliminar todos los permisos de carlos 

revoke select on GESTION_CENTRO.* from "carlos_user"@"localhost";
-- dar acceso solo a la vista del ejercicio 2 (seguridad)

grant select on GESTION_CENTRO.vista_seguridad_sueldo to "carlos_user"@"localhost";

flush privileges; -- actualiza los permisos asignados para poder hacer pruebas en tiempo real, sin tener que volver a conectarse a la base de datos

-- ejercicio 7: revocar permisos
-- quitar a daniel de permiso insert
-- comprobar que ya no puede insertar

revoke insert on GESTION_CENTRO.asignaturas from "daniel_user"@"%";

SHOW GRANTS FOR 'daniel_user'@'%';

-- practicar

create user "usuario_prueba"@"localhost" identified by "123456";

use GESTION_CENTRO;

select * from profesores;

select * from asignaturas;

-- crear indice

create index idx_prueba on asignaturas(nombre_asig);

select * from asignaturas where nombre_asig = "Bases de datos";

-- crear vista

create view vista_prueba as
select a.nombre_asig, p.nombre from profesores p join asignaturas a on (p.id_profesor = a.id_profesor);

select * from vista_prueba;

-- agregar o quitar permisos

grant select, insert on GESTION_CENTRO.* to "usuario_prueba"@"localhost";

revoke insert on GESTION_CENTRO.asignaturas from "usuario_prueba"@"localhost";

show grants for "usuario_prueba"@"localhost";

grant delete on gestion_centro.asignaturas to "usuario_prueba"@"localhost";

revoke select, delete on gestion_centro.asignaturas from "usuario_prueba"@"localhost";

revoke select, delete on gestion_centro.* from "usuario_prueba"@"localhost";

revoke select on gestion_centro.* from "usuario_prueba"@"localhost";

grant select on gestion_centro.* to "usuario_prueba"@"localhost";

grant select on gestion_centro.vista_prueba to "usuario_prueba"@"localhost";

flush privileges;