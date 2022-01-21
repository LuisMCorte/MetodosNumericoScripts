%RegulaFalsi    Raices de ecuaciones (didáctica).
%   PuntoFijo( FUNCION, A, B, TOL, ITER )
%       [ data,Xr ] = RegulaFalsi( funcion, a, b, tol, iter)
%       Xr = raiz de la función
%       data = Matriz con el registro de cada iteracion
%       funcion = la función a tratar
%       a = valor inicial del intervalo en el que se encuentra la raiz
%       b = valor final del intervalo en el que se encuentra la raiz
%       tol = Tolerancia minima del metodo
%       iter = número máximo de iteraciones
%
%   See also Biseccion, Metodo de la secante, Newton-Raphson, PuntoFijo 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/17 13:02 $
%   Built-in function.
function[Xr,i,e] = RegulaFalsi(funcion, a, b, tol, iter = 1000)

%Definicion de datos iniciales
f = @(x) funcion(x);
Xold = NaN;
i = 1;

while 1
  %Calculo de Xnew (una posible raiz)
  Xnew = ( a*f(b) - b*f(a)) / ( f(b) - f(a) );
  
  
  %Intercambiar limites del intervalo
  if ( f(Xnew)*f(a)  > 0 )
    a = Xnew;
  elseif ( f(Xnew)*f(b)  > 0 )
    b = Xnew;
  endif
  
  %Calculo y evaluacion del error  
  e = abs( Xnew - Xold );
 
  
  if (i >= iter)
    msgID = 'Regula Falsi:iteraciones';
    msg = 'Gran número de iteraciones, posiblemente el método divergió';
    error(msgID,msg)
  endif
  
  if ( e < tol )
    Xr = Xnew;
    break ;
  else
    Xold = Xnew;
    i+=1;
  endif
  
endwhile

return
endfunction