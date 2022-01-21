%Metodo de Newton
%       Newton(fun,dx,x0)llenar
%       [iteraciones,solucion,error] = Newton(fun,dx,x0)
%       solucion = raiz
%       error 
%       fun = funcion a tratar
%       dx = primera derivada de fun
%       x0 = valor inicial
%
%   See also Metodo de la secante
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/20 16:00 $
%   Built-in function.


function [iteraciones,solucion,error] = Newton(fun,dx,x0,tol=0.001,iter=1000)
  i = 0;
  
  x=x0;
  f = fun(x);         % Evaluación de la funcion
  
  while abs(f) > tol && i < iter
    try
      x = x - (f)/dx(x);
    catch
      fprintf('Error dx = 0');
      exit(1)
    end_try_catch
    f = fun(x);
    i = i+1;
   
  endwhile
  
  if abs(f) > tol
    i = -1;
  endif
 error  = abs(f); 
 iteraciones = i;
 solucion = x;
end



  
  
  
  