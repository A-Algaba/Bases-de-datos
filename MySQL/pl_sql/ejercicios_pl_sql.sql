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

-- Ejercicio 5 corregido

declare

    v_matricula coche.matricula%type := '&matricula';
    v_coche coche%rowtype;

begin

    select * into v_coche from coche
    where matricula = v_matricula;
    
    dbms_output.put_line('Informacion del coche - Matricula ' || v_coche.matricula || chr(10) || ' descripcion ' || v_coche.id_modelo || chr(10) || ' precio ' 
    || v_coche.precio_compra );

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

    v_cantidad number;
    v_marca marcas_coche.marca%type := 'Citroen';
begin

    select count(*) into v_cantidad
    from modelo_coche mo join marcas_coche ma 
    on (mo.id_marca = ma.id_marca) where ma.marca = v_marca;

    dbms_output.PUT_LINE('El total de citroens que hay es de ' || v_cantidad);

end;

/

-- ejercicios de triggers

alter table coche add fecha_insercion date;

create or replace trigger trg_coche_insercion
before insert on coche
for each row
begin 
    :new.fecha_insercion := sysdate;
end;

insert into coche(matricula, id_modelo, precio_compra) values
('222333A', 2, 3);

-- ejercicio 3 de disparadores

create or replace trigger trg_no_bajar_precio
before update of precio_compra on coche
for each row
begin
    if :new.precio_compra < :old.precio_compra then
    raise_application_error(- 20001, 'El precio_compra no puede ser inferior');
    end if;
end;

update coche set precio_compra = 800 where matricula = '3345GVF';

-- procedimientos

create or replace procedure mostrar_ventas_empleado(v_dni in empleado.dni%type) as
    v_total_ventas number;

begin
    select count(dni_empleado) into v_total_ventas
    from vende v join empleado e on (v.dni_empleado = e.dni)
    where e.dni = v_dni;

    if v_total_ventas = 0 then
    dbms_output.put_line('El empleado ' || v_dni || ' no tiene ventas');
    elsif v_total_ventas > 0 then
    dbms_output.put_line('El empleado ' || v_dni || ' tiene ventas ' || v_total_ventas);
    end if;
end;

/

declare
    v_cantidad_ventas vende.dni_empleado%type := '90774536C';

begin
    mostrar_ventas_empleado(v_cantidad_ventas);
end;

/

-- Crea un procedimiento que reciba como parámetro la matrícula de un coche vendido. El procedimiento debe mostrar por pantalla el nombre del cliente que 
-- compró el coche, el nombre del empleado que realizó la venta, el precio de venta (debe manejar  NO_DATA_FOUND).

create or replace procedure matricula_coche_vendido(v_matricula vende.matricula%type) as
    v_precio number;
    v_nombre_cliente cliente.nombre%type;
    v_nombre_empleado empleado.nombre%type;

begin
    select v.precio, c.nombre, e.nombre into v_precio, v_nombre_cliente, v_nombre_empleado
    from vende v join cliente c on (v.dni_cliente  = c.dni)
    join empleado e on (v.dni_empleado = e.dni)
    where v.matricula = v_matricula;

    dbms_output.put_line('Datos del coche vendido, matricula: ' || v_matricula || ' precio: ' || v_precio || ' nombre del cliente que lo compro: ' || v_nombre_cliente || 'nombre del empleado encargado: ' || v_nombre_empleado);
end;

-- ejecutamos el procedimiento

declare
    v_matricula vende.matricula%type := '3345GVF';
begin
    matricula_coche_vendido(v_matricula);
end;

-- funcion
-- Función que devuelve el nombre de un cliente, pasa el dni por parámetro. (en caso de NO_DATA_FOUND lanzar excepción)

create or replace function nombre_cliente_encontrar(v_dni_cliente cliente.dni%type)
    return varchar2 as
    v_cliente_nombre cliente.nombre%type;
begin
    select nombre into v_cliente_nombre
    from cliente where v_dni_cliente = dni;

    
    return v_cliente_nombre;
    exception
        when no_data_found then
        dbms_output.put_line('No se encontro ningun cliente con ese dni');
        return null;
end;

-- mostramos el resultado

declare
    v_dni_cliente cliente.dni%type := '07541212F';
    v_encontrado varchar(100);
begin
    v_encontrado := nombre_cliente_encontrar(v_dni_cliente);
    dbms_output.put_line('El nombre del cliente cuyo dni es ' || v_dni_cliente || ' es ' || v_encontrado);
end;

-- ejercicios inventados

-- Ejercicio 1
-- Crea una función que reciba la matrícula de un coche y devuelva su precio de compra.

create or replace function matricula_precio_coche(v_matricula vende.matricula%type)
    return number as
    v_precio vende.precio%type;
begin
    select precio into v_precio
    from vende where matricula = v_matricula;
    
    return v_precio;
end;

declare
    v_matricula_coche vende.matricula%type := '3345GVF';
    v_resultado vende.precio%type;
begin
    v_resultado := matricula_precio_coche(v_matricula_coche);
    dbms_output.put_line('El precio del coche cuya matricula es ' || v_matricula_coche || ' es de ' || v_resultado);
end;

-- Ejercicio 2 
-- Crea un procedimiento que reciba el DNI de un cliente y muestre por consola su nombre y teléfono.

create or replace procedure datos_cliente(v_dni_cliente cliente.dni%type) as
    v_nombre cliente.nombre%type;
    v_telef cliente.telef%type;
begin
    select nombre, telef into v_nombre, v_telef
    from cliente where dni = v_dni_cliente;
    dbms_output.put_line('Datos del cliente cuyo dni es ' || v_dni_cliente || ', nombre: ' || v_nombre || ', telef: ' || v_telef);
end;

declare
    v_dni_cliente cliente.dni%type := '05478218A';
begin
    datos_cliente(v_dni_cliente);
end;

-- Ejercicio 3
-- Crea un trigger que impida insertar un coche con un precio de compra negativo.

create or replace trigger evitar_precios_negativos
before insert on coche
for each row
begin
    if:new.precio_compra <= 0 then
        raise_application_error(- 20001, 'No se permite poner precios negativos');
        end if;
end;

INSERT INTO COCHE (
    MATRICULA,
    ID_MODELO,
    PRECIO_COMPRA
) VALUES ('9999AA', '1', 0);

-- Ejercicio 4
-- Crea un procedimiento que reciba una forma de pago y muestre cuántas ventas se han realizado con esa forma de pago.

create or replace procedure mostrar_ventas_pago(v_forma_pago tipos_forma_pago.forma_pago%type) as
    v_ventas vende.id_forma_pago%type;
begin
    select count(v.id_forma_pago) into v_ventas
    from vende v join tipos_forma_pago t on (v.id_forma_pago = t.id_forma_pago)
    where forma_pago = v_forma_pago;
    dbms_output.put_line('El tipo cantidad de ventas con el pago ' || v_forma_pago || ' es de ' || v_ventas);
end;

declare
    v_tipo_pago tipos_forma_pago.forma_pago%type := 'Financiado';
begin
    mostrar_ventas_pago(v_tipo_pago);
end;