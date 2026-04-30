-- disparadores o triggers

create or replace trigger check_precio_compra
before insert on coche
for each row
begin
    if :new.precio_compra is null or :new.precio_compra <= 0 then
        raise_application_error(- 20001, 'El precio_compra no es correcto');  -- es como hacer un break en programacion
        end if;
end;

/

insert into coche (matricula, id_modelo, precio_compra) values
('1234AA', 1, 1);