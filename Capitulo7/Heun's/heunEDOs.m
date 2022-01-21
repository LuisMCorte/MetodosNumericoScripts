%Sistemas de Ecuaciones - Metodo de Heun's.
%       heuns(f,x,h,xfinal,y0) llenar
%       [xn,y] = midpoint(f,x,h,xfinal,y0)
%       f = función a tratar
%       x0 = inicio del intervalo
%       xf = fin del intervalo
%       h = salto
%       n = final del intervalo
%       y0 = [* ;*]condicion inicial  
%
%   See also Metodo de Euler
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/10 11:00 $
%   Built-in function.

function [xn, y] = heunEDOs(f,x0,xf,y0,ne=2,h)
  
  %Captura de errores
  if isnumeric(x0) ~= 1
    msgID = '(x0) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(xf) ~= 1
    msgID = '(x0) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if length(y0) ~= 2
    msgID = '(y0) debe una matriz 2x1';
    msg = 'Matriz invalida';
    error(msgID,msg)
  endif
  
  if isnumeric(h) ~= 1
    msgID = '(h) debe ser un valor númerico';
    msg = 'Números invalido';
    error(msgID,msg)
  endif
  
  n = abs((xf - x0)/h);       %intervalos
  xn = x0:h:xf;               %segmentos
  y = zeros(ne,n+1);          %Matriz 2xn+1
  y(:,1) = y0;                %Valor inicial
  
  for k=1:n
    k1 = f(xn(k),y(:,k));              
    k2 = f(xn(k)+h,y(:,k)+k1*h);       %Ecuacion predictora
    y(:,k+1) = y(:,k)+h/2*(k1+k2);     %Ecuacion correctora (7.23)
  endfor
endfunction

  
  
  