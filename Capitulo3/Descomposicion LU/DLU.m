%DLU   Valores de las incognitas en un sistema de ecuaciones (didáctica).
%   DLU( MATRIX,B )
%       [L,U, vals_aux, resps] = DLU(matrix, b)
%       L = Matriz L de la descomposicion
%       U = Matriz U de la descomposicion
%       vals_aux = valores auxiliares conseguidos luego de resolver U|b
%       resps = Valores de las incognitas en un sistema de ecuaciones
%
%   See also ResolverTI, ResolverTS, Gauss_Jordan, Gauss 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/23 15:51 $
%   Built-in function.
function[L,U, vals_aux, resps] = DLU(matrix, b)

%************************** + Etapa para calculo de L + *****************************

%1. Calculo de la matriz triangular inferior
[m,n] = size(matrix); %m filas n columnas
iteraciones = sum(m - 1:-1:1);

L = eye(m);
columna = 1;
fila = m;
filap = 1;
i = 0;

while (1)
  %Definicion del valor pivote
  pivote = matrix(filap,columna);
  valor  = matrix(fila,columna);
  
  %Proteccion ante un pivote = 0.
  if (pivote == 0)
    msgID = 'DLU: Division para cero';
    msg = 'Error al encontrar la matiz triangular inferior. Escalar finito. Vuelva a intentarlo luego de intercambiar filas';
    error(msgID,msg)
  endif
  
  %Calculo del escalar 
  escalar = - valor/pivote;
  %Almacenar el escalar en L
  L(fila,columna) = - escalar;
  
  %Cambiar la fila por la suma entre las anteriores
  matrix(fila,:) = escalar * matrix(filap,:) + matrix(fila,:);
  i+=1;
  
  if (i == iteraciones)
    break;
  elseif (fila == filap + 1)
    columna += 1;
    fila = m;
    filap += 1;
  else
    fila = fila - 1;
  endif
  
endwhile
%***********************************************************************************************
U = matrix(:,:);

%************************** + Etapa para calculo de L * vals_aux = b + *************************
vals_aux = ResolverTS(L,b);
%***********************************************************************************************

%************************** + Etapa para calculo de U * resps = vals_aux + *********************
resps = ResolverTI(U,vals_aux);
%***********************************************************************************************
return
endfunction
