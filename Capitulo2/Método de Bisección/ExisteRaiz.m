function [ IntCorrecto, Xa, Xb ] = ExisteRaiz( inicio, final, funcion )

%Generacion del intervalo
entrada = inicio:0.5:final;
%Definicion de la funcion y calculo del rango
imagen = arrayfun( funcion, entrada );

#Ploteo de la funcion. De esta manera, el usuario verifica visualmente la respuesta del programa
plot(entrada,imagen);
grid on;

IntCorrecto = 0;

%Si el primer valor de la imagen es negativo, buscamos un valor positivo
if ( imagen(1) < 0 )
  
  for posicion = 2:numel(imagen)
    
    if ( imagen(posicion) ) > 0 %Al encontrar un valor positivo, confirmamos que existe una raiz en el intervalo
      IntCorrecto = 1;
      break;
    endif
    
  endfor

elseif ( imagen(1) > 0 )%Si el primer valor de la imagen es positivo, buscamos un valor negativo
  
  for posicion = 2:numel(imagen)
    
    if ( imagen(posicion) ) < 0
      IntCorrecto = 1;%Al encontrar un valor positivo, confirmamos que existe una raiz en el intervalo
      break;
    endif
    
  endfor
  
endif

Xa = entrada( posicion - 1 );%Creacion del nuevo valor de inicio para el intervalo
Xb = entrada( posicion );%Creacion del nuevo valor de final para el intervalo

return
endfunction







