%Secante    Raices de ecuaciones (didáctica).
%   Secante(FUN,X0,X1,TOL,ITER) llenar
%       [solucion,iteraciones] = secante(fun, a, b, t, iter)
%       solucion = raiz de la función
%       iteraciones = numero de iteraciones ejcutadas
%       fun = la función a tratar
%       [x0,x1] intervalo
%       tol = tolerancia
%       iter = número máximo de iteraciones
%
%   See also SLASH, ... (poner los otros métodos que se utilizan para 
%   resolver las raices de ecuaciones.

%   2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/11 15:18 $
%   Built-in function.

function [solucion,iteraciones]  = Secante(fun,x0,x1,tol=0.001,iter=100)
  
  % Evaluación de la funcion con las condiciones iniciales 
  f0 = fun(x0);
  f1 = fun(x1);
  i = 0;
  
 while abs(f1) > tol && i < iter
   try 
     x = x1 - ((f1)*(x0-x1))/(f0-f1);   % Formula del método de la secante
   catch
     break
   end_try_catch
   
   % asignacion de nuevos valores de acorde al método de la secante
   x0 = x1;
   x1 = x;
   f0 = f1;
   f1 = fun(x1);
   i++; 
   
 endwhile
 
 %Hay una solucion o el numero de iteraciones son demasiadas 
 if abs(f1) > tol;
   i = -1;
 endif
 
 %Resultados
 solucion = x1;
 iteraciones = i;
 
end