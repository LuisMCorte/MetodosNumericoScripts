%InterLaf Retorna los coeficientes de polinomio de interpolacion de Lagrange
%   InterLag( X,Y )
%       [Lpols,Px] = InterLag( X,Y )
%       Lpols = Matriz con los coeficientes de cada Li
%       Px = Polinomio de interpolacion de Lagrange
%       X = valores medidos experimentalmente
%       Y = valores medidos experimentalmente
%
%   See also Ajuste mínimos cuadrados, regresión lineal
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/14 20:00 $
%   Built-in function.
function[Lpols,Px] = InterLag(X,Y)

if (size(X,2) != size(Y,2))
  msgID = 'InterLag: Dimensiones distintas';
  msg = 'Los vectores que contienen las mediciones no tienen la misma longitud';
  error(msgID,msg)
endif

n = size(X,2); 
Px = 0;

for i = 1:n
  
  %Reinicio del valor del producto
  producto = 1;  

  %Filtro de los valores de X que puede por cada iteracion
  if ( i == 1 )
    xvals = X( 2:n );
  elseif( i == n )
    xvals = X( 1:n-1 );
  else
    xvals = [ X(1:i-1) X(i+1:n)];
  endif
  
  %Calculo de L_i(x)
  for j = 1:n-1
    
    if ( X(i) - xvals(j) == 0 )
      msgID = 'InterLag: Division para cero';
      msg = 'Existen valores de x repetidos';
      error(msgID,msg)
    endif
    
    producto = (conv( producto,[1,- xvals(j)] )) / ( X(i) - xvals(j));
    
  endfor

  %Almacenamiento de el polinomo L_i en Lpols
  Lpols(i,:) = producto;
  %Calculo del polinomio de aproximacion
  Px = Y(i)*producto + Px;
endfor
return
endfunction
