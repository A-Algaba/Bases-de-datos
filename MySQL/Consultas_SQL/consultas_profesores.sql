use profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;

-- 1.Muestra los datos de la asignatura y el dni del profesor que la imparte

select i.dni, a.descripcion from asignaturas a join imparte i on a.codigo = i.asignatura;
select * from asignaturas a, imparte i where a.codigo = i.asignatura;

-- 2.Muestra los datos de los profesores que imparten alguna asignatura

select * from profesores p join imparte i on p.dni = i.dni order by ingreso desc;

-- 3 lo mismo pero con natural join

select * from profesores natural join imparte; -- esta pensado para no duplicar mismos datos en una tabla por ejemplo, el dni

-- Producto cartesiano (CROSS JOIN)
select * from profesores, asignaturas;
select * from profesores cross join asignaturas;

-- 4.Suma de creditos que imparte el profesor segun su dni

select i.dni, sum(a.creditos) as suma_creditos from asignaturas a join imparte i on a.codigo = i.asignatura group by i.dni having suma_creditos >= 12;

-- 5.Mostrar el nombre de los profesores que imparten alguna asignatura

select p.nombre, a.descripcion from profesores p join imparte i on p.dni = i.dni
join asignaturas a on a.codigo = i.asignatura;

select nombre, count(*) num_asignaturas_imparte from profesores p join imparte i on p.dni = i.dni group by i.dni; -- opcion mas correcta

select * from profesores natural join imparte i join asignaturas a on a.codigo = i.asignatura; -- opcion con natural join

-- 6.Mostrar el nombre del profesor y la descripcion de la asignatura que imparte

select * from profesores p join imparte i on p.dni = i.dni 
join asignaturas a on a.codigo = i.asignatura;


-- 7 DNI y el nombre del coordinador y las descripcion de la asignatura que coordina

select * from coordinadores c join asignaturas a on c.asig = a.codigo;

-- 8 DNI del profesor y la suma de los creditos que prepara

select dni, sum(creditos) from prepara p join asignaturas a on p.asignatura = a.codigo group by dni;

-- 9. LEFT JOIN. datos de todos los profesores y si imparte alguna asignatura, los datos de ella.

select * from profesores p left join imparte i on p.dni = i.dni;

-- 10 RIGHT JOIN. datos de todos los profesores y si prepara alguna asignatura los datos de ella.

select * from prepara p  right join profesores pr on p.dni = pr.dni;

-- SUBCONSULTAS

-- 1.mostrar todos los datos de las asignaturas que tienen mas creditos que la asignatura PC

select * from asignaturas where creditos > (select creditos from asignaturas where codigo = "PC");

-- 2.mostrar la descripcion de las asignaturas que tiene mas creditos que todas las demas

select descripcion from asignaturas where creditos = (select max(creditos) from asignaturas);

-- 3. nombre de las asignaturas que no son las que menos creditos tienen

select * from asignaturas where creditos > (select min(creditos) from asignaturas);

select * from asignaturas where creditos != (select min(creditos) from asignaturas);

-- 4 datos de las asignaturas que se imparten

select * from asignaturas where codigo in(select asignatura from imparte);

-- 5 datos de las asignaturas que NO se imparte

select * from asignaturas where codigo not in(select asignatura from imparte);

-- 6 datos de los profesores que imparten alguna asignatura

select * from profesores where dni in (select dni from imparte);

select * from profesores natural join imparte;

-- 7 datos de los profesores que NO imparten ninguna asignatura

select * from profesores where dni not in (select dni from imparte);


-- 8 datos de los profesores que no preparan ninguna asignatura

select * from profesores where dni not in (select dni from prepara);

-- 9 datos de los profesores que preparan alguna asignatura

select * from profesores where dni in(select dni from prepara);

-- 10 datos de los profesores que no preparan ni imparten ninguna asignatura

select * from profesores where dni not in(select dni from prepara) and dni not in (select dni from imparte);

-- 11 ¿tenemos profesores?

select exists (select * from profesores) as respuesta;


-- EJERCICIOS INVENTADOS


-- 1. Obtener el nombre de todos los profesores junto con las asignaturas que imparten (código y descripción de la asignatura).

select p.nombre, a.codigo , a.descripcion from profesores p join imparte i on i.dni = p.dni join asignaturas a on i.asignatura = a.codigo;

-- 2. Listar el nombre de los coordinadores junto con el código y descripción de la asignatura que coordinan. Incluir también los coordinadores que no tienen asignatura asignada.

select c.nombre, a.codigo, a.descripcion from coordinadores c left join asignaturas a on c.asig = a.codigo;

--  3. Mostrar el nombre de los profesores, la descripción de las asignaturas que preparan y los créditos totales (teóricos + prácticos) de cada asignatura.

select p.nombre, a.descripcion, a.creditos, a.creditosp from profesores p natural join prepara pe join asignaturas a on pe.asignatura = a.codigo;

-- 4. Obtener el nombre de todos los profesores y las asignaturas que imparten. Incluir también los profesores que no imparten ninguna asignatura.

select * from profesores p left join imparte i on p.dni = i.dni;

-- 5. Listar todas las asignaturas con su descripción y el nombre de los profesores que las preparan. Mostrar también las asignaturas que nadie prepara.

select a.codigo, a.descripcion, p.dni,  pr.nombre from asignaturas a left join prepara p  on p.asignatura = a.codigo right join profesores pr on pr.dni = p.dni;

-- 6. Encontrar los nombres de los profesores que preparan más asignaturas que las que imparten.

select * from profesores where dni in (select dni from prepara);

-- 7. Obtener el nombre y DNI de los profesores que preparan todas las asignaturas que tienen créditos prácticos (creditosp) no nulos.

select * from profesores where dni in (select dni from imparte where asignatura in (select codigo from asignaturas where creditosp is not null));

-- 8. Listar los nombres de las asignaturas que son preparadas pero no impartidas por ningún profesor.

select * from  asignaturas where codigo in (select asignatura from prepara);