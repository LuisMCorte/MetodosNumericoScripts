%Conjugate Gradient Method
%       conj_grad(f,x,tol=0.001) llenar
%       [x,error] = conj_grad(f,x,tol=0.001)
%       f = función a tratar
%       x = [x1 x2] valores iniciales
%   
%
%   See also Newton method
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/13 15:00 $
%   Built-in function.


function [x,error] = conj_grad(f,x,tol=0.001)
  
  syms x1 x2                                % Paquete simbolico

  
  %Captura de errores
  if length(x) ~= 2
    msgID = 'Dimension vector';
    msg = 'El vector x es incorrecto';
    error(msgID,msg)
  endif
  
  %Matriz Hessiana
  A =  double(hessian(f));                  
  
  %Calculo del gradiente en el punto inicial
  df_dx1 = diff(f,x1);                     
  df_dx2 = diff(f,x2);
  grad = [subs(df_dx1,[x1,x2], [x(1),x(2)]) subs(df_dx2, [x1,x2], [x(1),x(2)])];
  b = -double(grad');
  
  %Método del Gradiente Conjugado
  d = b - A * x;
  p = d;
  rsold = d' * d;

  for i = 1:length(b)
    ap = A * p;
    
    %Captura de errores
    if (p' * ap) == 0
      msgID = 'Datos incorrectos';
      msg = 'Division para cero';
      error(msgID,msg)
    endif
    
    alpha = rsold / (p' * ap);
    x = x + alpha * p;
    d = d - alpha * ap;
    rsnew = d' * d;
    
    %Convergencia y error del método
    if sqrt(rsnew) < tol
      break
    endif
    p = d + (rsnew / rsold) * p;
    rsold = rsnew;
    error = abs((norm(rsnew) - norm(rsold))/(norm(rsnew)));
  endfor
endfunction