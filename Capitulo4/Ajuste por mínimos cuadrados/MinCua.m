%MinCua    Coeficiente A y B para una aproximación.
%   MINCUA(X,Y)
%       [A,B] = MinCua(x,y)
%       A = valor A, tal que y_aprox = Ax + B
%       B = valor B, tal que y_aprox = Ax + B
%       x = vector con los valores de la variable dependiente
%       y = vector con los valores de la variable independiente
%
%   See also Regresion Lineal 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/6 13:02 $
%   Built-in function.
function[A,B] = MinCua(x,y)

if ( size(x,2) != size(y,2) )
  msgID = 'MinCua: Cantidades de datos';
  msg = 'Las cantidades de las mediciones no coinciden';
  error(msgID,msg)
endif

if ( size(x,2)*sum(x.^2) - (sum(x))^2 == 0 )
  msgID = 'MinCua: División para cero';
  msg = 'Existión una división para cero en el proceso';
  error(msgID,msg)
endif

%Calculo de A mediante la expresion A = ( n*sum_xy - sum_x*sum_y )/( n*sum_xsq - (sum_x)^2)
A = ( size(x,2)*sum(x.*y) - sum(x)*sum(y) )/( size(x,2)*sum(x.^2) - (sum(x))^2 );

%Calculo de B mediante la expresion B = prom_y - A*prom_x
B = mean(y) - A*mean(x);

return
endfunction