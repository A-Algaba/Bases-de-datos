-- Ejercicio 1. Alberto Algaba

declare
    v_matricula coche.matricula%type := '&matricula_del_coche';
    v_precio_compra coche.precio_compra%type;
    v_precio_venta vende.precio%type;
    v_forma_pago tipos_forma_pago.forma_pago%type;
begin
    select c.precio_compra, v.precio, t.forma_pago into v_precio_compra, v_precio_venta, v_forma_pago
    from coche c join vende v on (c.matricula = v.matricula)
    join tipos_forma_pago t on (v.id_forma_pago = t.id_forma_pago)
    where c.matricula = v_matricula;
    
    dbms_output.put_line('Matricula: ' || v_matricula || ' / Precio compra: ' || v_precio_compra || ' / Precio venta: ' || v_precio_venta || ' / Forma de pago: ' || v_forma_pago);
    
    exception when no_data_found then
    dbms_output.put_line('No existe ninguna venta con esa matricula');
end;

-- Ejercicio 2. Alberto Algaba

create or replace procedure Puesto_Empleado(v_dni_empleado empleado.dni%type) as
    v_nombre_empleado empleado.nombre%type;
    v_tipo_puesto tipos_puesto.puesto%type;
begin
    select e.nombre, t.puesto into v_nombre_empleado, v_tipo_puesto
    from empleado e join tipos_puesto t on (e.id_puesto = t.id_puesto)
    where e.dni = v_dni_empleado;
    
    dbms_output.put_line('Nombre: ' || v_nombre_empleado || chr(10) 
    || 'Puesto: ' || v_tipo_puesto);
    
    exception when no_data_found then
        dbms_output.put_line('No se encuentra el DNI');
end;

begin
    Puesto_Empleado('&dni_del_empleado');
end;

-- Ejercicio 3. Alberto Algaba

create or replace function ContarCoches(v_precio_minimo coche.precio_compra%type)
return number as
    v_precio_minimo_coche coche.precio_compra%type;
    v_precio_compra coche.precio_compra%type;
begin
    
    select count(precio_compra) into v_precio_minimo_coche
    from coche where precio_compra = v_precio_minimo;
    
    return v_precio_minimo_coche;
 
end;

declare
    v_precio_minimo number := '&precio_minimo_del_coche';
    v_resultado number;
begin
    v_resultado := ContarCoches(v_precio_minimo);
    
    dbms_output.put_line('Cantidad de coches con precio >= ' || v_precio_minimo || ' : ' || v_resultado);
end;

-- Ejercicio 4. Alberto Algaba

alter table coche add precioIVA number;
alter table coche add fechaMod date;

create or replace trigger trg_actualizar_precio_iva
before update on coche
for each row
begin
    if :new.precio_compra >= :old.precio_compra then
        :new.precioIVA := :new.precio_compra * 1.10;
        :new.fechaMod := sysdate;
        else
        raise_application_error(-20001, 'Error en el precio');
        end if;
end;

update coche set precio_compra = 5000 where matricula = '3287GVA';