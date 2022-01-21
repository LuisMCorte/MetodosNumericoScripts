%Quadratic interpolation search method
%       search_quadratic(f,x0,x1,x2,N=100,tol=0.0001) llenar
%       [x3, minf,error,iter]=search_quadratic(f,x0,x1,x2,N=100,tol=0.0001)
%       f = función a tratar
%       x0 = valor 1
%       x1 = valor 2
%       x2 = valor 3
%
%   See also Golden section search method
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/06 15:00 $
%   Built-in function.

function [x3,minf,error,iter] = search_quadratic(f,x0,x1,x2,N=100,tol=0.0001)
  
  %Captura de errores
  if isnumeric(x0) ~= 1
    msgID = '(x0) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(x1) ~= 1
    msgID = '(x1) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(x2) ~= 1
    msgID = '(x2) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  %Quadratic interpolation search method
  
  for i = 1:N
    
    %Numerador
    N = f(x0)*(x1^2 - x2^2) + f(x1)*(x2^2 - x0^2) + f(x2)*(x0^2 - x1^2);
    
    %Denominador
    D = 2*f(x0)*(x1 - x2) + 2*f(x1)*(x2 - x0) + 2*f(x2)*(x0 - x1);
    
    %Formula del método de busqueda
    x3 = N / D;
    
   %Nuevos Valores 
    x0 = x1;
    x1 = x2;
    x2 = x3;
  
    %Contador para iteraciones
    j = i+1;
  
    %Error y Convergencia
    currentv(j) = x3;
    iter = j - 1;
    error = abs(currentv(j) - currentv(j-1)); 
    if error < tol
      break
    endif
  endfor
  
  %Valor mínimo de la función
  minf = f(x3);

endfunction

