USE liga;

-- PRIMERA RELACION

-- Ejercicio 1, consultar los datos de los jugadores del equipo 3 ordenados por su apellido
SELECT * FROM jugador WHERE equipo = 3 ORDER BY apellido;

-- Ejercicio 2, consultar datos de los jugadores que sean escolta o alero
SELECT *FROM jugador WHERE posicion = 'escolta' OR posicion = 'Alero';

-- Ejercicio 3, consultar datos de jugadores con salarios entre 60.000 y 100.000

SELECT * FROM jugador WHERE salario BETWEEN 60000 AND 100000;

-- Ejercicio 4, consultar datos de jugadores que sean pivot ordenados por su identificador

SELECT * FROM jugador WHERE posicion = 'pivot' ORDER BY id_jugador;

-- Ejercicio 5, consultar datos de jugadores que midan mas de 2 metros y ganen al menos 50.000 euros

SELECT * FROM jugador WHERE altura > '2.00' AND salario >= '50000';

-- Ejercicio 6, consultar datos de los jugadores que sean pivot y ganen mas de 100.000 euros

SELECT * FROM jugador WHERE posicion = 'pivot' AND salario >= '100000';

-- Ejercicio 7, consultar datos de los jugadores de los equipos 1 y 2 que juegen como base

SELECT * FROM jugador WHERE posicion = 'Base' AND equipo IN (1, 2);

-- Ejercicio 8, consultar datos de los jugadores de los equipos 1 y 2 que ganen mas de 80.000 euros

SELECT * FROM jugador WHERE equipo IN (1, 2) AND salario >= 80000;

-- Ejercicio 9, listar posiciones diferentes que pueden ocupar los jugadores

SELECT DISTINCT posicion FROM jugador;

-- Ejercicio 10, consultar datos de los 5 jugadores mas altos

SELECT * FROM jugador ORDER BY altura LIMIT 5;

-- Ejercicio 11, calcular en la columna de salario neto anual el salario neto anual de los jugadores sabiendo que el IRPF del 18% deja un 82% del salario bruto.

SELECT nombre, apellido, salario, salario * 0.82 AS salario_neto_anual FROM jugador;

-- Ejercicio 12, calcular en la columna de salario neto anual el salario neto anual de los jugadores que sea al menos 70.000 euros

SELECT *, salario * 12 * 0.82 AS salario_neto_anual from jugador WHERE salario * salario * 12 * 0.82 >= 70000;

-- Ejercicio 13, consultar datos sobre los jugadores sin posicion asignada

SELECT * FROM jugador WHERE posicion IS NULL;

-- Ejercicio 14, consultar partidos jugados antes del 2012

SELECT * FROM partido  WHERE fecha < '2012-01-01';

-- Ejercicio 15, consultar datos de jugadores que midan mas de 1.90 y cobren mas de 100.000 euros
SELECT * FROM jugador WHERE altura >= '1.90' AND salario >= '100000';

-- Segunda relacion

-- Ejercicio 1, calcular el salario medio de todos los jugadores

SELECT AVG (salario) AS salario_medio FROM jugador;

-- Ejercicio 2, mostrar el id del equipo y la suma de de las alturas de sus jugadores cuando la suma supere los 5 metros

SELECT equipo, SUM(altura) AS suma_alturas FROM jugador GROUP BY equipo HAVING SUM(altura) > 5;

-- Ejercicio 3, mostrar cada equipo cuantos jugadores estan asignados a cada posicion

SELECT COUNT(*) AS jugadores_mas_2m FROM jugador WHERE altura > 2.00;

-- Ejercicio 4, mostrar para cada equipo cuantos jugadores están asignados a cada posición

SELECT equipo, posicion, COUNT(*) AS total_jugadores FROM jugador GROUP BY equipo, posicion;

-- Ejercicio 5, mostrar el id del equipo y el salario total de cada equipo, pero solo para los equipos que tengan más de 4 jugadores registrados

SELECT equipo, SUM(salario) AS salario_total, COUNT(*) AS num_jugadores FROM jugador GROUP BY equipo HAVING COUNT(*) > 4;

-- Ejercicio 6, calcular cuántas ciudades distintas tienen equipos registrados

SELECT COUNT(DISTINCT ciudad) AS ciudades_distintas FROM equipo;

-- Ejercicio 7, mostrar para cada equipo el salario mas alto, el mas bajo y la diferencia entre ambos

SELECT equipo, MAX(salario) AS salario_maximo, MIN(salario) AS salario_minimo, (MAX(salario) - MIN(salario)) AS diferencia FROM jugador GROUP BY equipo;


-- Ejercicio 8, seleccionar el salario medio de cada equipo, pero solo para los equipos cuya media sea superior a 100000

SELECT equipo, AVG(salario) AS salario_medio FROM jugador GROUP BY equipo HAVING AVG(salario) > 100000;


-- Ejercio 9, consultar el numero de jugadores por equipo

SELECT equipo, COUNT(*) AS num_jugadores FROM jugador GROUP BY equipo;

-- Ejercicio 10, altura media por equipo

SELECT equipo, AVG(altura) AS altura_media FROM jugador GROUP BY equipo;

-- Ejercicio 11, salario total por equipo

SELECT equipo, SUM(salario) AS salario_total FROM jugador GROUP BY equipo;

-- Ejercicio 12, equipos con una altura media superior a 2 metros

SELECT equipo, AVG(altura) AS altura_media FROM jugador GROUP BY equipo HAVING AVG(altura) > 2.00;

-- Ejercicio 13, el jugador mas alto por equipo (altura máxima)

SELECT equipo, MAX(altura) AS altura_maxima FROM jugador GROUP BY equipo;
