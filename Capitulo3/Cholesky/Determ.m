%Determ   Retorna el determiante de una matriz
%   Determ( MATRIX )
%       [determ] = Determ(matrix)
%       determ = Determinante de la matriz
%       matrix = matriz cuadratica
%
%   See also det
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/28 15:42 $
%   Built-in function.

function[determ] = Determ(matrix)

[m,n] = size(matrix); %m filas n columnas

if (m != n)
  msgID = 'Gauss-Jordan: Matriz invalida';
  msg = 'La matriz debe ser cuadrada';
  error(msgID,msg)
endif


iteraciones = sum(m - 1:-1:1);

%*************** + Etapa para calcular triangular inferior + *******************
columna = 1;
fila = m;
filap = 1;
i = 0;

while (1)
  %Definicion del valor pivote
  pivote = matrix(filap,columna);
  %Definicion del valor a eliminar
  valor  = matrix(fila,columna);
  
  %Proteccion ante un pivote = 0.
  if (pivote == 0)
    msgID = 'Gauss-Jordan: Division para cero';
    msg = 'No existe un escalar finito. Division para cero. Vuelva a intentarlo luego de intercambiar filas';
    error(msgID,msg)
  endif
  
  %Calculo del escalar
  escalar = - valor/pivote;
  
  %Cambiar la fila por la suma entre las anteriores
  matrix(fila,:) = escalar * matrix(filap,:) + matrix(fila,:);
  %b(fila) = escalar * b(filap) + b(fila);
  #disp(b);
  #disp(matrix);
  #fprintf('\n');
  i+=1;
  
  if (i == iteraciones)
    break;
  elseif (fila == filap + 1)%Cambio de columna y fila pivote, reinicio de fila  
    columna += 1;
    fila = m;
    filap += 1;
  else
    fila = fila - 1;
  endif

endwhile
%**********************************************************************************


%**************************** + Calculo del determinante + ************************
determ = matrix(1,1);

for i = 2:1:m
  determ = determ * matrix(i,i);
endfor
return
endfunction