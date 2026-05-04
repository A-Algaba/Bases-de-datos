-- 1.Mostrar hola mundo pantalla


declare

begin

dbms_output.PUT_LINE('Hola Mundo');
    
end;

/

-- 2.Ejemplo 2


declare
    numero number := 5; --comentario
begin

    numero := numero * 2;
    dbms_output.PUT_LINE('El numero: ' || numero);
    
end;

/

-- 3.Declarar una variable numerica y mostrar si es mayor o menor


declare
    numero number := 10;
    
begin

    if numero >= 5 then
        dbms_output.PUT_LINE('El numero ' || numero || ' es mayor');
    end if;
    if numero <= 4 then
        dbms_output.PUT_LINE('El numero ' || numero || ' es menor');
        end if;
        
end;

/

/*4. Mostrar los n�meros del 1 al 10 con while*/


declare

numeros number := 0;

begin

    while numeros <= 9 loop
    
    numeros := numeros + 1;
    
        dbms_output.PUT_LINE('numeros: ' || numeros);
        
    end loop;

end;

/

/*5. Mostrar los n�meros del 1 al 10 con for*/

declare

numeros number := 0;

begin

    for i in 1..10 loop
    numeros := numeros + 1;
        dbms_output.PUT_LINE('numero: ' || numeros);
    end loop;

end;

/

/*6. Declarar variable n�merica nota y mostrar con casi si aprobado o no */

declare

    nota number := 5;

begin

    if nota >= 5 then
        dbms_output.PUT_LINE('Aprobado');
        
    elsif nota <=4 then
        dbms_output.PUT_LINE('Suspenso');
        
        end if;
end;

/

/*Excepcion zero_divide*/

declare
    prueba number := 5;
    resultado number;
    
begin
    resultado := prueba / 0; -- esto debe causar excepcion
    dbms_output.PUT_LINE('El resultado es ' || resultado);
    
    EXCEPTION
        when ZERO_DIVIDE then
            dbms_output.PUT_LINE('Error en la operacion, no se puede dividr entre 0' || SQLERRM);
        when OTHERS then
            dbms_output.PUT_LINE('Error desconocido');
end;