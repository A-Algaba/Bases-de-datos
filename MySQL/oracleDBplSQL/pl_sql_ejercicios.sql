-- BLOQUE ANONIMO

-- 1.Mostrar el nombre de la marca dado su id

declare
    v_id marcas_coche.id_marca%type := &id_marca1;
    -- el &id_marca1 es como hacer un scanner en java, es crear un promt
    -- con %type dices que v_id asocias el tipo de dato que hay en el id_marca de la tabla, marcas_coche, ya que no se sabe si es un int o varchar, 
    --entonces con %type se asocia independientemente de lo que sea el tipo de dato
    v_marca marcas_coche.marca%type;
    
begin
   select marca into v_marca from marcas_coche
   where id_marca = v_id;
   dbms_output.PUT_LINE('La marca con id ' || v_id || ' es un ' || v_marca);
end;

/

-- Ejercicio 2

declare
    v_dni cliente.dni%type := '&dni_cli';
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    
    select nombre, telef into v_nombre, v_telefono from cliente
    where dni = v_dni;
    
    dbms_output.PUT_LINE('El nombre del cliente es ' || v_nombre || ' y su numero de telefono es ' || v_telefono);
    
end;

/

-- Ejercicio 3

declare
    v_dni cliente.dni%type := '&dni_cli';
    v_nombre cliente.nombre%type;
    v_telefono cliente.telef%type;
begin
    
    select nombre, telef into v_nombre, v_telefono from cliente
    where dni = v_dni;
    
    dbms_output.PUT_LINE('El nombre del cliente es ' || v_nombre || ' y su numero de telefono es ' || v_telefono);
    
    exception when no_data_found then
        dbms_output.PUT_LINE('No hay datos');
end;

/

-- Ejercicio 4

declare
    v_row_type cliente%rowtype;
begin
    
    select * into v_row_type from cliente
    where dni = '&dni_cliente';
    
    dbms_output.PUT_LINE('El nombre del cliente es ' || v_row_type.nombre || ' y su numero de telefono es ' || v_row_type.telef);
    
    exception when no_data_found then
        dbms_output.PUT_LINE('No hay datos');
end;

/

-- Ejercicio 5

declare
    
    v_matricula coche.matricula%type := '&matricula_coche';
    v_modelo coche.id_modelo%type;
    v_precio coche.precio_compra%type;
    
begin

    select id_modelo, precio_compra into v_modelo, v_precio from coche
    where matricula = v_matricula;
    
    dbms_output.PUT_LINE('El id del modelo es ' || v_modelo || ' y su precio es de ' || v_precio);

end;

/

-- Ejercicio 6

declare
    -- variables de la tabla modelo_coche
    v_modelo modelo_coche.id_modelo%type := &modelo_coche;
    v_descripcion modelo_coche.descripcion%type;
    v_id_marca1 modelo_coche.id_marca%type;
    -- variables de la tabla marcas_coche
    v_id_marca marcas_coche.id_marca%type;
    v_marca marcas_coche.marca%type;
begin
    
    select descripcion, marc.id_marca, marca into v_descripcion, v_id_marca, v_marca from modelo_coche modc
    join marcas_coche marc on (modc.id_marca = marc.id_marca)
    where id_modelo = v_modelo;
    
    dbms_output.PUT_LINE('Informacion del coche: ' || v_descripcion || ' - ' || v_id_marca || ' - ' || v_marca);
end;

/

-- Ejercicio 7

declare

    v_dni_empleado vende.dni_empleado%type := '&dni_empleado1';
    v_ventas vende.precio%type;

begin

    select sum(precio) into v_ventas from vende
    where dni_empleado = v_dni_empleado;
    
    dbms_output.PUT_LINE('La suma total de ventas por empleado es de ' || v_ventas);

end;

/

-- Ejercicio 8

declare

    v_id_marca marcas_coche.id_marca%type;
    v_marca_citroen marcas_coche.marca%type;

begin

    select count(id_marca), marca into v_id_marca, v_marca_citroen
    from marcas_coche group by v_marca_citroen having marca = 'citroen';

    dbms_output.PUT_LINE('El total de citroens que hay es de ' + v_id_marca);

end;