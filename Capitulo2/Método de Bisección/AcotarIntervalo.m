function[ error, NewStart, NewEnd ] = AcotarIntervalo( OldStart, OldEnd, funcion )

fprintf('\n-------Nueva Iteracion-----\n')

%Calculo de la posible raiz
PosibleRaiz = ( OldStart + OldEnd ) / 2;

if ( ( funcion(OldStart) * funcion(PosibleRaiz) ) > 0 )
    
    NewStart = PosibleRaiz; %El intervalo inicia con el valor de la posible raiz
    NewEnd   = OldEnd; %El fin del intervalo no varia
else
    NewStart = OldStart;
    NewEnd = PosibleRaiz;
  endif
  
fprintf('Intervalo acotado: [ %f , %f  ]\n', NewStart, NewEnd)%Informar del intervalo acotado
  
error = ( abs( ( OldStart - PosibleRaiz ) ) / OldStart ) * 100 %Informar del valor de error

return
endfunction