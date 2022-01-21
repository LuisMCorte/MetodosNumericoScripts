%Interpolacion Polinomial de Newton
%       Interpolacion Newton(x,y) llenar
%       [a] = interpolacion(x,y)
%       x = vector de datos
%       y = vector de datos
%
%   See also Interpolacion polinomial de Newton
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/10 17:46 $
%   Built-in function.

function [a] = interpolacion(x,y)
  
  n = length(x);
  n0 = length(y);
    
    %Captura de errores
  if n ~= n0
    msgID = 'Regresión Lineal : Datos incorrectos';
    msg = 'Los datos fueron mal ingresados';
    error(msgID,msg)
  endif
  
  %Matriz para alamacenar 
  m = zeros(n);
  
  %Transponemos el vector "y" en la primera columna de "m"
  m(:,1) = y;

  %Calculo de diferencias finitas
  for i=1:(n-1)
    for j=1:i
      m(i+1,j+1) = (m(i+1,j) - m(i,j)) / (x(i+1) - x(i-j+1));
      
      %Captura de errores (Division para cero)
      if (x(i+1) - x(i-j+1)) == 0
        msgID = 'Interpolacion : División para cero';
        msg = 'Error: Los datos fueron mal ingresados';                              
        error(msgID,msg)
      endif
      
    endfor
  endfor
  
  %Coeficientes
  a = diag(m);
  
endfunction



  



