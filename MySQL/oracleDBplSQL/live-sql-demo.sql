-- procedimientos

create or replace procedure contar_modelos_coche(v_marca marcas_coche.marca%type) as

    v_cantidad number;

begin

    select count(*) into v_cantidad 
    from modelo_coche mo join marcas_coche ma on (mo.id_marca = ma.id_marca)
    where ma.marca = v_marca;

    dbms_output.put_line('La cantidad de coches es ' || v_marca || ' es ' || v_cantidad);

end;

/

declare

    v_marca marcas_coche.marca%type := 'Citroen';

begin

    contar_modelos_coche(v_marca);

end;


-- realizar una funcion q devuelva la suma de ventas, pasa el dni del empleado por parametro

create or replace function precio_venta(v_dni vende.dni_empleado%type) 
return number
as

    v_sumaprecio vende.precio%type := 0;

begin

    select sum(precio) into v_sumaprecio
    from vende
    where v_dni = dni_empleado;

    return v_sumaprecio;

end;

/

declare

    v_dni vende.dni_empleado%Type := '90774536C';
    v_suma vende.precio%type;

begin
    v_suma := precio_venta(v_dni);
    dbms_output.put_line('La suma de ventas es ' || v_suma);
end;