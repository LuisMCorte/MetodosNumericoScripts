function[ RaizAprox ] = EncontrarRaiz( Error, iteraciones , inicio, final, funcion)
  
  %Calculo de los limites del primer intervalo. Busqueda de la posibilidad de existencia de una raiz
  [ continuar, NewStart, NewEnd ] = ExisteRaiz( inicio, final,funcion);

  switch continuar %Evaluacion del valor de continuar 
  
    case{ 0 }%Si continuar es falso, informamos de la inexistencia de la raiz.
      fprintf( 'No existe raiz en el intervalo [%i,%i].\n', inicio, final )
  
    case{ 1 }%De lo contrario, el metodo de biseccion inicia su proceso 
    
      %Informar sobre la existencia de una raiz y muestra del primer intervalo 
      fprintf( '\nExiste raiz en el intervalo [%i,%i].\nEl intervalo inicial para la biseccion es [%5.2f,%5.2f].\n \n', inicio, final, NewStart, NewEnd )
    
      %Acotacion sucesiva del intervalo
      i = 0;
      while (continuar == 1)
      
        [error , NewStart, NewEnd] = AcotarIntervalo( NewStart, NewEnd, funcion );
       
        if ( (error < Error) || (i == iteraciones) )%El limite de iteraciones y un valor menor al error detienen el proceso de acotacion.
          continuar = 0;       
        endif
      
        i += 1;%Si el proceso no ha sido detenido, suma de uno al contador de iteraciones.
      endwhile
    
      RaizAprox = ( NewStart + NewEnd )/2;%Calculo de la raiz aproximada
      fprintf('\nLa raiz aproximada esta en Xr = %.4f. Siendo f(Xr) = %.4f\n',RaizAprox , funcion(RaizAprox))%Informe de la raiz conseguida y de su imagen.  
      
  endswitch
endfunction
  


