%Diferencias Finitas - Ecuacion de Laplace.
%       findifflaplace(frontera,puntos) llenar
%       [res] = findifflaplace(frontera,puntos,iter=100,tol=0.001)
%       frontera(1) = valor lado izquierdo
%       frontera(2) = valor lado derecho
%       frontera(3) = valor lado de abajo
%       frontera(4) = valor lado de arriba
%       puntos(1) = numero de puntos horizontales
%       puntos(2) = numero depuntos verticales  
%
%   See also Metodo de Euler
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/10 11:00 $
%   Built-in function.

function [res] = findifflaplace(frontera,puntos,iter=100,tol=0.001)
  
  %Captura de errores
  if length(frontera) ~= 4
    msgID = 'findifflaplace : Datos incorrectos';
    msg = 'Los datos fueron mal ingresados';
    error(msgID,msg)
  endif
  
  if length(puntos) ~= 2
    msgID = 'findifflaplace : Datos incorrectos';
    msg = 'Los datos fueron mal ingresados';
    error(msgID,msg)
  endif
  
  %Variables
  k = 0;
  conv = 0;   %convergencia
  res = 0;    %resultado
  
  %LLenado de la matriz m con las fronteras
  
  %Lados de abajo y arriba
  for i=1:puntos(1)+2
    m(i,1) = frontera(3);
    m(i,puntos(2)+2) = frontera(4);
  endfor
 
  %Lados de la izquierda y derecha 
  for j=1:puntos(2)+2
    m(1,j) = frontera(1);
    m(puntos(1)+2,j) = frontera(2);
  endfor
  
  %Valor del centro
  v = 1/4 * (sum(frontera));   
  
  %Llenado de la matriz con el valor de v
  for i=2:puntos(1)+1
    for j=2:puntos(2)+1
      m(i,j) = v;
    endfor
  endfor

  %Proceso Iterativo
  
  while k<iter & conv==0
    %Solucion no encontrada
    k = k+1;
    t = m;
    for i=2:puntos(1)+1
      for j=2:puntos(2)+1
        m(i,j) = 1/4 * (m(i-1,j)+m(i+1,j)+m(i,j+1)+m(i,j-1));
      endfor
    endfor
    
    %Solucion encontrada
    if norm((m-t),inf) / norm(m,inf) < tol
      conv = 1;
    endif
  endwhile

  if conv == 1
    res = m;
  endif
  
endfunction
