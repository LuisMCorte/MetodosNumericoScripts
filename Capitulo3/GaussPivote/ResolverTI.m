%ResolverTI   Resuelve sistemas de ecuaciones de una matriz triangular inferior (didáctica).
%   ResolverTI( MATRIX,B )
%       [vals] = ResolverTI(matrix,b)
%       vals = valores de las variables del sistema de ecuaciones
%       matrix = matriz triangular inferior
%       b = coeficientes del sistema de ecuaciones
%
%   See also ResolverTS, DLU, Gauss_Jordan, Gauss
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/23 15:42 $
%   Built-in function.
function[vals] = ResolverTI(matrix,b)

n = size(matrix)(2); %m filas n columnas

%Despeje y calculo de cada variable
vals = [];

%Calculo del primer valor x_n
x_n = b(n)/matrix(n,n);
vals(1) = x_n;
j = 2;


for i = n-1 :-1:1
  
  cols = size(vals)(2);
  
  %Calculo de coeficientes
  coefs = matrix(i, i + 1:n);%Coeficientes que acompanian a cada variable por fila
  
  coefs_acarreados = -1 * sum((coefs) .* (vals(cols:-1:1)) );
  
  if ( matrix(i,i) == 0 )
  msgID = 'ResolverTI: Posicion pivote igual a cero';
  msg = 'Existe una fila llena de ceros. No hay solucion unica. Intente cambiar de orden las filas';
  error(msgID,msg)
  endif

  x_n =  (b(i) + coefs_acarreados )/matrix(i,i);
  
  vals(j) = x_n;
  j+=1;

endfor

vals = vals(n:-1:1);
return
endfunction