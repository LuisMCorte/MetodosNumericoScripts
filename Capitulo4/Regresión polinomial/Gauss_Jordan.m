%Gauss_Jordan (didáctica).
%   Gauss_Jordan( MATRIX,B )
%       [ b_answ ] = PuntoFijo( matrix,b)
%       b_answ = vector con los valores de las incognitas
%       matrix = matriz que contienes los coeficientes de la incognitas
%       b = vector que contiene los coeficientes de las ecuaciones
%
%   See also Gauss, Factoriacion LU, Gauss con pivote 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/21 23:47 $
%   Built-in function.

function[b_answ] = Gauss_Jordan(matrix,b)

[m,n] = size(matrix); %m filas n columnas

if (m != n)
  msgID = 'Gauss-Jordan: Matriz invalida';
  msg = 'La matriz debe ser cuadrada';
  error(msgID,msg)
endif


iteraciones = sum(m - 1:-1:1);
%escalar = NaN;

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
  b(fila) = escalar * b(filap) + b(fila);
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

matrixTI = matrix(:,:);
bTI = b(:);

%*************** + Etapa para calcular triangular superior + *******************
columna = n;
fila = 1;
filap = m;
i = 0;

while (1)
  %Definicion del valor pivote
  pivote = matrix(filap,columna);
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
  b(fila) = escalar * b(filap) + b(fila);
  #disp(b);
  #disp(matrix);
  #fprintf('\n');
  i+=1;
  
  if (i == iteraciones)
    break;
  elseif (fila == filap - 1)
    columna = columna - 1;
    fila = 1;
    filap = filap - 1;
  else
    fila = fila + 1;
  endif

endwhile

matrixTS = matrix(:,:);
bTS = b(:);
%************************** + Etapa de division de coeficientes +*************************
for i = 1:1:m
  
  if (matrix(i,i) == 0)
    msgID = 'Gauss-Jordan: Division para cero';
    msg = 'Existió una fila de ceros';
    error(msgID,msg)
  endif
  
  b(i) = b(i)/matrix(i,i);
endfor 

b_answ = b;
return
endfunction