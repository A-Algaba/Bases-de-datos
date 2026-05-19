-- Ejercicio 1
-- Alberto Algaba Calderon

create or replace type Producto as object (
    codigo varchar2(10),
    nombre varchar2(100),
    categoria varchar(50),
    precio number(10,2),
    member function obtenerEtiqueta return varchar2
) not final;

create or replace type body Producto as
member function obtenerEtiqueta return varchar2 is
begin
    return self.codigo || self.nombre || self.categoria;
    end;
end;
    
create or replace type ProductoElectronico under Producto(
    garantia_meses number,
    member procedure aplicarDescuento(porcentaje number)
);

create or replace type body ProductoElectronico as
member procedure aplicarDescuento(porcentaje number) is
begin
        self.precio := self.precio - (self.precio * porcentaje / 100);
    end;
end;

create or replace type ProductoAlimentario under Producto(
    calorias_por_100g number
);

-- Ejercicio 2
-- Alberto Algaba Calderón

create table tabla_productosElectronicos of ProductoElectronico;
create table tabla_productosAlimentarios of ProductoAlimentario;

-- Ejercicio 3
-- Alberto Algaba Calderón

declare
    pe1 ProductoElectronico;
    pe2 ProductoElectronico;
begin
    pe1 := ProductoElectronico('ELEC001', 'TelevisorOLED', 'Electronica', 800, 24);
    pe2 := ProductoElectronico('ELEC002', 'Smartphone Pro', 'Electronica', 600, 12);
    
    -- aplicamos desceunto de un 15% para pe1 y un 15% para pe2
    pe1.aplicarDescuento(10);
    pe2.aplicarDescuento(15);
    
    --insertamos los objetos en las tablas
    insert into tabla_productosElectronicos values(pe1);
    insert into tabla_productosElectronicos values(pe2);
    
    -- mostramos el precio tras el descuento aplicado
    
    dbms_output.put_line('Precio tras el descuento de ' || pe1.codigo || ': ' || pe1.precio || chr(10)
    || 'Precio tras el descuento de ' || pe2.codigo || ': ' || pe2.precio);
end;

-- Ejercicio 4
-- Alberto Algaba Calderón

declare
    producto tabla_productosElectronicos%rowtype;
begin
    -- en esta consulta se deberia de añadir el valor de la tabla, y filtrar el producto por su codigo dentro de la variable objeto producto
    select value(pre) into producto from tabla_productosElectronicos pre where producto.codigo = 'ELEC001';
    
    -- actualiar con update, donde se tendria que poner un alias de la tabla, pasar la variable a el alias de la tabla, y establecer el tipo de dato para actualizar
    
end;