%Gauss con Pivoteo   Sistemas de ecuaciones (didáctica).
%       jacobi(A,b) llenar
%       [x,error,it] = jabobi(A,b,x_0)
%       A = matriz de coeficientes
%       b = vector independiente
%       x_0 = vetor de valores inicial
%
%   See also Metodo de Jacobi
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/30 16:00 $
%   Built-in function.

function [x,error,it] = jacobi(A,b,x_0,tol=1e-13,iter=1000)
  
  %Datos
  n = length(b);                      %longitud del vector independiente
  [M,N] = size(A);                    %Longitud de la primera fila
  it = 0;
  
  %Captura de errores
  if M ~= N
    msgID = 'Jacobi : Dimension Matriz';
    msg = 'La matriz A no es cuadrada';
    error(msgID,msg)
  endif
  
  %Matrices para el metodo
  x_0 = zeros(n,1);                  %columna de ceros
  d = diag(diag(A));                 %Matriz Diagonal
  inv_d = inv(d);                    %Matriz inversa de d
  E = -tril(A,-1);                   %Matriz triangular inferior de A
  F = -triu(A,+1) ;                  %Matriz triangular superior de A
  res = norm(A.*x_0 - b);
  error = res/norm(b);               %Calculo del error
  
  %Parte Iterativa
  while it<iter && error > tol       %Bucle while para la convergencia
    it++;                            %Contador de iteraciones
    x = inv_d*(E+F)*x_0+inv_d*b;     %Metodo de Jacobi
    res = norm(A .* (x - b));
    error = res/norm(b);            %Calculo del error
    x_0 = x;
  endwhile
  return
endfunction
  
  

  

  


  
  
  

  
  