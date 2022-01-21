%   EncontrarRaiz(Errror, iteraciones, inicio, final, funcion) 
%
%       [datos] = EncontrarRaiz(Errror, iteraciones, inicio, final, funcion)
%       datos = Matriz que recopila los resultados de cada iteracion: Nuevo inicio y final de intervalo y error entre ambos. 
%       Error = Diferencia porcentual minima que puede darse entre el valor inicial y final del intervalo.
%       fun = la función a tratar
%       [inicio,final] intervalo
%       iteraciones = número máximo de iteraciones

function[ RaizAprox, error, i ] = EncontrarRaiz( inicio, final, funcion, Error = 0.01, iteraciones = 1000 )
  
  %Calculo de los limites del primer intervalo. Busqueda de la posibilidad de existencia de una raiz
##  [ continuar, NewStart, NewEnd ] = ExisteRaiz( inicio, final,funcion);
  
  continuar = 1;
  NewStart = inicio;
  NewEnd = final;

  switch continuar %Evaluacion del valor de continuar 
  
    case{ 0 }%Si continuar es falso, informamos de la inexistencia de la raiz.
      fprintf( 'No existe raiz en el intervalo [%i,%i].\n', inicio, final )
  
    case{ 1 }%De lo contrario, el metodo de biseccion inicia su proceso 
    
      %Acotacion sucesiva del intervalo
      i = 0;
      while (continuar == 1)
      
        [error , NewStart, NewEnd] = AcotarIntervalo( NewStart, NewEnd, funcion );
        
        
        if ( (error < Error) )%El limite de iteraciones y un valor menor al error detienen el proceso de acotacion.
          continuar = 0;
          break;       
        endif
        
        if (i == iteraciones)
          continuar = 0;
          break;
        endif
        
        
        i += 1;%Si el proceso no ha sido detenido, suma de uno al contador de iteraciones.
      endwhile
    
      RaizAprox = ( NewStart + NewEnd )/2;%Calculo de la raiz aproximada
      
  endswitch
endfunction