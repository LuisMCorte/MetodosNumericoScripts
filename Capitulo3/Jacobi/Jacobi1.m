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
%   $Revision: 0.1 $  $Date: 2021/11/20 16:00 $
%   Built-in function.
 
function x = Jacobi(A, b, epsilon, maxit, x)
  
% Captura de errores
  [na, ma] = size(A);
  if na ~= ma
    msgID = 'Jacobi : Dimension Matriz';
    msg = 'La matriz A no es cuadrada';
    error(msgID,msg)
  endif

  [nb, mb] = size (b);
  if nb ~= na || mb~=1
    msgID = 'Jacobi : Vector';
    msg = 'E vector b es incorrrecto';
    error(msgID,msg)
  endif
  
  dx = zeros(na,1);
  for k=1:maxit
    sum = 0;
    for i=1:na
      dx(i) = b(i);
      for j=1:na
        dx(i) = dx(i) - A(i,j)*x(j); 
      endfor
      dx(i) = dx(i)/A(i,i);
      x(i) = x(i) + dx(i);
      if (dx(i) >= 0)
        sum = sum + dx(i);
      else 
        sum = sum - dx(i);
      endif
    endfor
    
    %error
    if(sum <= epsilon)
    sum                 %error
        break
    end
end
fprintf('The final answer obtained after %g iterations is  \n', k);
